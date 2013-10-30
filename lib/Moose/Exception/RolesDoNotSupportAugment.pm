package Moose::Exception::RolesDoNotSupportAugment;
BEGIN {
  $Moose::Exception::RolesDoNotSupportAugment::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::RolesDoNotSupportAugment::VERSION = '2.1104'; # TRIAL
}

use Moose;
extends 'Moose::Exception';

sub _build_message {
    "Roles cannot support 'augment'";
}

1;
