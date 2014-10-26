package Moose::Exception::NeitherRoleNorRoleNameIsGiven;
$Moose::Exception::NeitherRoleNorRoleNameIsGiven::VERSION = '2.1307'; # TRIAL
use Moose;
extends 'Moose::Exception';

sub _build_message {
    "You need to give role or role_name or both";
}

1;
