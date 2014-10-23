package Moose::Exception::RoleNameRequiredForMooseMetaRole;
$Moose::Exception::RoleNameRequiredForMooseMetaRole::VERSION = '2.1305'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role';

sub _build_message {
    "You must supply a role name to look for";
}

1;
