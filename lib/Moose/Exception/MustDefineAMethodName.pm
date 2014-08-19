package Moose::Exception::MustDefineAMethodName;
$Moose::Exception::MustDefineAMethodName::VERSION = '2.1301'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Instance';

sub _build_message {
    "You must define a method name";
}

1;
