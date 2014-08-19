package Moose::Exception::CreateMOPClassTakesHashRefOfMethods;
$Moose::Exception::CreateMOPClassTakesHashRefOfMethods::VERSION = '2.1301'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::RoleForCreateMOPClass';

sub _build_message {
    "You must pass an HASH ref of methods";
}

1;
