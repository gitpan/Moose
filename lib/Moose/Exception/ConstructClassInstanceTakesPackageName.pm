package Moose::Exception::ConstructClassInstanceTakesPackageName;
BEGIN {
  $Moose::Exception::ConstructClassInstanceTakesPackageName::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::ConstructClassInstanceTakesPackageName::VERSION = '2.1201';
}

use Moose;
extends 'Moose::Exception';

sub _build_message {
    "You must pass a package name";
}

1;
