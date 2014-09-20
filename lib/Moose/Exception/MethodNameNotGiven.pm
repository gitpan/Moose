package Moose::Exception::MethodNameNotGiven;
$Moose::Exception::MethodNameNotGiven::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

sub _build_message {
    "You must define a method name to find";
}

1;
