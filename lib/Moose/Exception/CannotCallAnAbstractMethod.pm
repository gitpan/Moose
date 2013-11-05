package Moose::Exception::CannotCallAnAbstractMethod;
BEGIN {
  $Moose::Exception::CannotCallAnAbstractMethod::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::CannotCallAnAbstractMethod::VERSION = '2.1106'; # TRIAL
}

use Moose;
extends 'Moose::Exception';

sub _build_message {
    "Abstract method";
}

1;
