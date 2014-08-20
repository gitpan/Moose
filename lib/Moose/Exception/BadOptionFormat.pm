package Moose::Exception::BadOptionFormat;
$Moose::Exception::BadOptionFormat::VERSION = '2.1302'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Attribute';

has 'option_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

has 'option_value' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

sub _build_message {
    "bad accessor/reader/writer/predicate/clearer format, must be a HASH ref";
}

1;
