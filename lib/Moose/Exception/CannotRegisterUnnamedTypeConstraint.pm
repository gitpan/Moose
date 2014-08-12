package Moose::Exception::CannotRegisterUnnamedTypeConstraint;
BEGIN {
  $Moose::Exception::CannotRegisterUnnamedTypeConstraint::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Exception::CannotRegisterUnnamedTypeConstraint::VERSION = '2.1300'; # TRIAL
use Moose;
extends 'Moose::Exception';

sub _build_message {
    "can't register an unnamed type constraint";
}

1;
