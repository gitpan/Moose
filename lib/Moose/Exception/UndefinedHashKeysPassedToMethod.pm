package Moose::Exception::UndefinedHashKeysPassedToMethod;
$Moose::Exception::UndefinedHashKeysPassedToMethod::VERSION = '2.1400';
use Moose;
extends 'Moose::Exception';

has 'hash_keys' => (
    is         => 'ro',
    isa        => 'ArrayRef',
    required   => 1
);

has 'method_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    "Hash keys passed to ".$self->method_name." must be defined";
}

1;
