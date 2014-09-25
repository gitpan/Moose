package Moose::Exception::ConstructClassInstanceTakesPackageName;
$Moose::Exception::ConstructClassInstanceTakesPackageName::VERSION = '2.1304'; # TRIAL
use Moose;
extends 'Moose::Exception';

sub _build_message {
    "You must pass a package name";
}

1;
