package Moose::Meta::Method::Accessor::Native::Array::shallow_clone;
BEGIN {
  $Moose::Meta::Method::Accessor::Native::Array::shallow_clone::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Meta::Method::Accessor::Native::Array::shallow_clone::VERSION = '2.1300'; # TRIAL
use strict;
use warnings;

use Params::Util ();

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader';

sub _minimum_arguments { 0 }

sub _maximum_arguments { 0 }

sub _return_value {
    my $self = shift;
    my ($slot_access) = @_;

    return '[ @{ (' . $slot_access . ') } ]';
}

no Moose::Role;

1;
