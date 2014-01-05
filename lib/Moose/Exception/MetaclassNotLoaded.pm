package Moose::Exception::MetaclassNotLoaded;
BEGIN {
  $Moose::Exception::MetaclassNotLoaded::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::MetaclassNotLoaded::VERSION = '2.1108'; # TRIAL
}

use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

sub _build_message {
    my $self = shift;
    "The Metaclass ".$self->class_name." must be loaded. (Perhaps you forgot to 'use ".$self->class_name."'?)";
}

1;
