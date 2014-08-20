package Moose::Exception::MustHaveAtLeastOneValueToEnumerate;
$Moose::Exception::MustHaveAtLeastOneValueToEnumerate::VERSION = '2.1302'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::ParamsHash';

has 'class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    "You must have at least one value to enumerate through";
}

1;
