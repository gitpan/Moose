package Moose::Meta::Method::Accessor::Native::Array::sort;
BEGIN {
  $Moose::Meta::Method::Accessor::Native::Array::sort::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Meta::Method::Accessor::Native::Array::sort::VERSION = '2.1102'; # TRIAL
}

use strict;
use warnings;

use Params::Util ();

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader';

sub _maximum_arguments { 1 }

sub _inline_check_arguments {
    my $self = shift;

    return (
        'if (@_ && !Params::Util::_CODELIKE($_[0])) {',
            $self->_inline_throw_exception( "InvalidArgumentToMethod => ".
                                            'argument                => $_[0],'.
                                            'method_name             => "sort",'.
                                            'type_of_argument        => "code reference",'.
                                            'type                    => "CodeRef",',
            ) . ';',
        '}',
    );
}

sub _return_value {
    my $self = shift;
    my ($slot_access) = @_;

    return '$_[0] '
             . '? sort { $_[0]->($a, $b) } @{ (' . $slot_access . ') } '
             . ': sort @{ (' . $slot_access . ') }';
}

no Moose::Role;

1;
