package Moose::Exception::MustSpecifyAtleastOneMethod;
$Moose::Exception::MustSpecifyAtleastOneMethod::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role';

sub _build_message {
    "Must specify at least one method";
}

1;
