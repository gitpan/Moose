package Moose::Exception::CreateMOPClassTakesArrayRefOfAttributes;
$Moose::Exception::CreateMOPClassTakesArrayRefOfAttributes::VERSION = '2.1302'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::RoleForCreateMOPClass';

sub _build_message {
    "You must pass an ARRAY ref of attributes";
}

1;
