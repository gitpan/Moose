package Moose::Exception::MustDefineAnAttributeName;
$Moose::Exception::MustDefineAnAttributeName::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

sub _build_message {
    "You must define an attribute name";
}

1;
