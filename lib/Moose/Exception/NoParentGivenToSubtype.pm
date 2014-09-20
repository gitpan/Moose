package Moose::Exception::NoParentGivenToSubtype;
$Moose::Exception::NoParentGivenToSubtype::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    "A subtype cannot consist solely of a name, it must have a parent";
}

1;
