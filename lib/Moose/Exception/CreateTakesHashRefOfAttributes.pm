package Moose::Exception::CreateTakesHashRefOfAttributes;
$Moose::Exception::CreateTakesHashRefOfAttributes::VERSION = '2.1401';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::RoleForCreate';

sub _build_message {
    "You must pass a HASH ref of attributes";
}

1;
