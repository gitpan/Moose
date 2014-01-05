package Moose::Exception::Legacy;
BEGIN {
  $Moose::Exception::Legacy::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::Legacy::VERSION = '2.1108'; # TRIAL
}

use Moose;
extends 'Moose::Exception';

1;
