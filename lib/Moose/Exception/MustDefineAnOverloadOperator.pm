package Moose::Exception::MustDefineAnOverloadOperator;
$Moose::Exception::MustDefineAnOverloadOperator::VERSION = '2.1401';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Instance';

sub _build_message {
    "You must define an overload operator";
}

1;
