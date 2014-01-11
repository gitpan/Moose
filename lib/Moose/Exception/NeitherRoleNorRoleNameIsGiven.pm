package Moose::Exception::NeitherRoleNorRoleNameIsGiven;
BEGIN {
  $Moose::Exception::NeitherRoleNorRoleNameIsGiven::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::NeitherRoleNorRoleNameIsGiven::VERSION = '2.1201';
}

use Moose;
extends 'Moose::Exception';

sub _build_message {
    "You need to give role or role_name or both";
}

1;
