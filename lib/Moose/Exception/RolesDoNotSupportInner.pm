package Moose::Exception::RolesDoNotSupportInner;
$Moose::Exception::RolesDoNotSupportInner::VERSION = '2.1307'; # TRIAL
use Moose;
extends 'Moose::Exception';

sub _build_message {
    "Roles cannot support 'inner'";
}

1;
