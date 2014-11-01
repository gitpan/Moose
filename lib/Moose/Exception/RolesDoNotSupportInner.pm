package Moose::Exception::RolesDoNotSupportInner;
$Moose::Exception::RolesDoNotSupportInner::VERSION = '2.1400';
use Moose;
extends 'Moose::Exception';

sub _build_message {
    "Roles cannot support 'inner'";
}

1;
