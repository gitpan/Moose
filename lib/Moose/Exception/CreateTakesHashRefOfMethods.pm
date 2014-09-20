package Moose::Exception::CreateTakesHashRefOfMethods;
$Moose::Exception::CreateTakesHashRefOfMethods::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::RoleForCreate';

sub _build_message {
    "You must pass a HASH ref of methods";
}

1;
