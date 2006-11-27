
package Moose::Meta::Method::Constructor;

use strict;
use warnings;

use Carp         'confess';
use Scalar::Util 'blessed', 'weaken', 'looks_like_number';

our $VERSION   = '0.01';
our $AUTHORITY = 'cpan:STEVAN';

use base 'Moose::Meta::Method';

sub new {
    my $class   = shift;
    my %options = @_;
        
    (exists $options{options} && ref $options{options} eq 'HASH')
        || confess "You must pass a hash of options"; 
    
    my $self = bless {
        # from our superclass
        '&!body'          => undef,
        # specific to this subclass
        '%!options'       => $options{options},
        '$!meta_instance' => $options{metaclass}->get_meta_instance,
        '@!attributes'    => [ $options{metaclass}->compute_all_applicable_attributes ], 
        # ...
        '$!associated_metaclass' => $options{metaclass},
    } => $class;

    # we don't want this creating 
    # a cycle in the code, if not 
    # needed
#    weaken($self->{'$!meta_instance'});
    weaken($self->{'$!associated_metaclass'});    

    $self->intialize_body;

    return $self;    
}

## accessors 

sub options       { (shift)->{'%!options'}       }
sub meta_instance { (shift)->{'$!meta_instance'} }
sub attributes    { (shift)->{'@!attributes'}    }

sub associated_metaclass { (shift)->{'$!associated_metaclass'} }

## method

sub intialize_body {
    my $self = shift;
    # TODO:
    # the %options should also include a both 
    # a call 'initializer' and call 'SUPER::' 
    # options, which should cover approx 90% 
    # of the possible use cases (even if it 
    # requires some adaption on the part of 
    # the author, after all, nothing is free)
    my $source = 'sub {';
    $source .= "\n" . 'my $class = shift;';
    
    $source .= "\n" . 'return $class->Moose::Object::new(@_)';
    $source .= "\n" . '    if $class ne \'' . $self->associated_metaclass->name . '\';';    
    
    $source .= "\n" . 'my %params = (scalar @_ == 1) ? %{$_[0]} : @_;';    
    
    $source .= "\n" . 'my $instance = ' . $self->meta_instance->inline_create_instance('$class');
    
    $source .= ";\n" . (join ";\n" => map { 
        $self->_generate_slot_initializer($_) 
    } 0 .. (@{$self->attributes} - 1));
    
    $source .= ";\n" . $self->_generate_BUILDALL();
    
    $source .= ";\n" . 'return $instance';
    $source .= ";\n" . '}'; 
    warn $source if $self->options->{debug};   
    
    my $code;
    {
        # NOTE:
        # create the nessecary lexicals
        # to be picked up in the eval 
        my $attrs = $self->attributes;
        
        $code = eval $source;
        confess "Could not eval the constructor :\n\n$source\n\nbecause :\n\n$@" if $@;
    }
    $self->{'&!body'} = $code;
}

sub _generate_BUILDALL {
    my $self = shift;
    my @BUILD_calls;
    foreach my $method (reverse $self->associated_metaclass->find_all_methods_by_name('BUILD')) {
        push @BUILD_calls => '$instance->' . $method->{class} . '::BUILD(\%params)';    
    }
    return join "\n" => @BUILD_calls; 
}

sub _generate_slot_initializer {
    my $self  = shift;
    my $index = shift;
    
    my $attr = $self->attributes->[$index];
    
    my @source = ('## ' . $attr->name);
    
    if ($attr->is_required && !$attr->has_default) {
        push @source => ('(exists $params{\'' . $attr->init_arg . '\'}) ' . 
                        '|| confess "Attribute (' . $attr->name . ') is required";');
    }
    
    if ($attr->has_default && !$attr->is_lazy) {
        
        push @source => 'if (exists $params{\'' . $attr->init_arg . '\'}) {';

            push @source => ('my $val = $params{\'' . $attr->init_arg . '\'};');
            if ($attr->has_type_constraint) {
                push @source => ('my $type_constraint = $attrs->[' . $index . ']->type_constraint;');

                if ($attr->should_coerce && $attr->type_constraint->has_coercion) {                    
                    push @source => $self->_generate_type_coercion($attr, '$type_constraint', '$val', '$val');        
                }
                push @source => $self->_generate_type_constraint_check($attr, '$type_constraint', '$val');        
            }
            push @source => $self->_generate_slot_assignment($attr, '$val');        
        
        
        push @source => "} else {";            
        
            my $default = $self->_generate_default_value($attr, $index);  
        
            push @source => ('my $val = ' . $default . ';');
            push @source => $self->_generate_type_constraint_check(
                $attr,
                ('$attrs->[' . $index . ']->type_constraint'), 
                '$val'
            ) if $attr->has_type_constraint;            
            push @source => $self->_generate_slot_assignment($attr, $default);                
                  
        push @source => "}";            
    }          
    else {
        push @source => '(exists $params{\'' . $attr->init_arg . '\'}) && do {';

            push @source => ('my $val = $params{\'' . $attr->init_arg . '\'};');
            if ($attr->has_type_constraint) {
                push @source => ('my $type_constraint = $attrs->[' . $index . ']->type_constraint;');

                if ($attr->should_coerce && $attr->type_constraint->has_coercion) {                    
                    push @source => $self->_generate_type_coercion($attr, '$type_constraint', '$val', '$val');        
                }
                push @source => $self->_generate_type_constraint_check($attr, '$type_constraint', '$val');        
            }
            push @source => $self->_generate_slot_assignment($attr, '$val');        
        
        push @source => "}";            
    }
    
    return join "\n" => @source;
}

sub _generate_slot_assignment {
    my ($self, $attr, $value) = @_;
    my $source = (
        $self->meta_instance->inline_set_slot_value(
            '$instance', 
            ("'" . $attr->name . "'"), 
            $value
        ) . ';'
    ); 
    
    if ($attr->is_weak_ref) {
        $source .= (
            "\n" .
            $self->meta_instance->inline_weaken_slot_value(
                '$instance', 
                ("'" . $attr->name . "'")
            ) . 
            ' if ref ' . $value . ';'
        );    
    }   
    
    return $source;
}

sub _generate_type_coercion {
    my ($self, $attr, $type_constraint_name, $value_name, $return_value_name) = @_;
    return ($return_value_name . ' = ' . $type_constraint_name .  '->coerce(' . $value_name . ');');
}

sub _generate_type_constraint_check {
    my ($self, $attr, $type_constraint_name, $value_name) = @_;
    return (
        'defined(' . $type_constraint_name . '->_compiled_type_constraint->(' . $value_name . '))'
    	. "\n\t" . '|| confess "Attribute (' . $attr->name . ') does not pass the type constraint ('
        . $attr->type_constraint->name . ') with " . (defined() ? "' . $value_name . '" : "undef");'
    );    
}

sub _generate_default_value {
    my ($self, $attr, $index) = @_;
    # NOTE:
    # default values can either be CODE refs
    # in which case we need to call them. Or 
    # they can be scalars (strings/numbers)
    # in which case we can just deal with them
    # in the code we eval.
    if ($attr->is_default_a_coderef) {
        return '$attrs->[' . $index . ']->default($instance)';
    }
    else {
        my $default = $attr->default;
        # make sure to quote strings ...
        unless (looks_like_number($default)) {
            $default = "'$default'";
        }
        
        return $default;
    }    
}

1;

1;

__END__

=pod

=head1 NAME 

Moose::Meta::Method::Constructor - Method Meta Object for constructors

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=over 4

=item B<new>

=item B<attributes>

=item B<meta_instance>

=item B<options>

=item B<intialize_body>

=item B<associated_metaclass>

=back

=head1 AUTHORS

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

