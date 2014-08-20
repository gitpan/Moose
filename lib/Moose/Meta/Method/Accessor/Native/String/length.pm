package Moose::Meta::Method::Accessor::Native::String::length;
$Moose::Meta::Method::Accessor::Native::String::length::VERSION = '2.1302'; # TRIAL
use strict;
use warnings;

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader';

sub _maximum_arguments { 0 }

sub _return_value {
    my $self = shift;
    my ($slot_access) = @_;

    return 'length ' . $slot_access;
}

no Moose::Role;

1;
