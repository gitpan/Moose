
package Moose::Meta::Method::Destructor;

use strict;
use warnings;

use Scalar::Util 'blessed', 'weaken';

our $VERSION   = '0.79';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use base 'Moose::Meta::Method',
         'Class::MOP::Method::Generated';

sub new {
    my $class   = shift;
    my %options = @_;

    (ref $options{options} eq 'HASH')
        || $class->throw_error("You must pass a hash of options", data => $options{options});

    ($options{package_name} && $options{name})
        || $class->throw_error("You must supply the package_name and name parameters $Class::MOP::Method::UPGRADE_ERROR_TEXT");

    my $self = bless {
        # from our superclass
        'body'                 => undef,
        'package_name'         => $options{package_name},
        'name'                 => $options{name},
        # ...
        'options'              => $options{options},
        'associated_metaclass' => $options{metaclass},
    } => $class;

    # we don't want this creating
    # a cycle in the code, if not
    # needed
    weaken($self->{'associated_metaclass'});

    $self->_initialize_body;

    return $self;
}

## accessors

sub options              { (shift)->{'options'}              }

## method

sub is_needed {
    my $self      = shift;
    my $metaclass = shift;

    ( blessed $metaclass && $metaclass->isa('Class::MOP::Class') )
        || $self->throw_error(
        "The is_needed method expected a metaclass object as its arugment");

    return $metaclass->find_method_by_name('DEMOLISH');
}

sub initialize_body {
    Carp::cluck('The initialize_body method has been made private.'
        . " The public version is deprecated and will be removed in a future release.\n");
    shift->_initialize_body;
}

sub _initialize_body {
    my $self = shift;
    # TODO:
    # the %options should also include a both
    # a call 'initializer' and call 'SUPER::'
    # options, which should cover approx 90%
    # of the possible use cases (even if it
    # requires some adaption on the part of
    # the author, after all, nothing is free)

    my @DEMOLISH_methods = $self->associated_metaclass->find_all_methods_by_name('DEMOLISH');

    return unless @DEMOLISH_methods;

    my $source = 'sub {';

    my @DEMOLISH_calls;
    foreach my $method (@DEMOLISH_methods) {
        push @DEMOLISH_calls => '$_[0]->' . $method->{class} . '::DEMOLISH()';
    }

    $source .= join ";\n" => @DEMOLISH_calls;

    $source .= ";\n" . '}';
    warn $source if $self->options->{debug};

    my $code = $self->_compile_code(
        environment => {},
        code => $source,
    ) or $self->throw_error("Could not eval the destructor :\n\n$source\n\nbecause :\n\n$@", error => $@, data => $source);

    $self->{'body'} = $code;
}


1;

__END__

=pod

=head1 NAME

Moose::Meta::Method::Destructor - Method Meta Object for destructors

=head1 DESCRIPTION

This class is a subclass of L<Class::MOP::Class::Generated> that
provides Moose-specific functionality for inlining destructors.

To understand this class, you should read the the
L<Class::MOP::Class::Generated> documentation as well.

=head1 INHERITANCE

C<Moose::Meta::Method::Destructor> is a subclass of
L<Moose::Meta::Method> I<and> L<Class::MOP::Method::Generated>.

=head1 METHODS

=over 4

=item B<< Moose::Meta;:Method::Destructor->new(%options) >>

This constructs a new object. It accepts the following options:

=over 8

=item * package_name

The package for the class in which the destructor is being
inlined. This option is required.

=item * name

The name of the destructor method. This option is required.

=item * metaclass

The metaclass for the class this destructor belongs to. This is
optional, as it can be set later by calling C<<
$metamethod->attach_to_class >>.

=back

=item B<< Moose::Meta;:Method::Destructor->is_needed($metaclass) >>

Given a L<Moose::Meta::Class> object, this method returns a boolean
indicating whether the class needs a destructor. If the class or any
of its parents defines a C<DEMOLISH> method, it needs a destructor.

=back

=head1 AUTHORS

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2009 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

