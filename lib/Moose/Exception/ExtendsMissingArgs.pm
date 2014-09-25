package Moose::Exception::ExtendsMissingArgs;
$Moose::Exception::ExtendsMissingArgs::VERSION = '2.1304'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

sub _build_message {
    "Must derive at least one class";
}

1;
