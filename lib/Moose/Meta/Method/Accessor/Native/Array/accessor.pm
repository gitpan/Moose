package Moose::Meta::Method::Accessor::Native::Array::accessor;
BEGIN {
  $Moose::Meta::Method::Accessor::Native::Array::accessor::AUTHORITY = 'cpan:STEVAN';
}
BEGIN {
  $Moose::Meta::Method::Accessor::Native::Array::accessor::VERSION = '1.9904'; # TRIAL
}

use strict;
use warnings;

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Array::set' => {
    -excludes => [
        qw( _generate_method
            _minimum_arguments
            _maximum_arguments
            _inline_process_arguments
            _inline_check_arguments
            _return_value)
    ]
    },
    'Moose::Meta::Method::Accessor::Native::Array::get' => {
    -excludes => [
        qw(
            _generate_method
            _minimum_arguments
            _maximum_arguments
            )
    ]
    };

sub _generate_method {
    my $self = shift;

    my $inv         = '$self';
    my $slot_access = $self->_get_value($inv);

    return (
        'sub {',
            'my ' . $inv . ' = shift;',
            $self->_inline_curried_arguments,
            $self->_inline_check_lazy($inv, '$type_constraint', '$type_constraint_obj'),
            # get
            'if (@_ == 1) {',
                $self->_inline_check_var_is_valid_index('$_[0]'),
                $self->Moose::Meta::Method::Accessor::Native::Array::get::_inline_return_value($slot_access),
            '}',
            # set
            'else {',
                $self->_inline_writer_core($inv, $slot_access),
            '}',
        '}',
    );
}

sub _minimum_arguments { 1 }
sub _maximum_arguments { 2 }

no Moose::Role;

1;
