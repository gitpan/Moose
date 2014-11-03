package Moose::Exception::DelegationToAClassWhichIsNotLoaded;
$Moose::Exception::DelegationToAClassWhichIsNotLoaded::VERSION = '2.1401';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Attribute';

has 'class_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

sub _build_message {
    my $self = shift;
    "The ".$self->attribute->name." attribute is trying to delegate to a class which has not been loaded - ".$self->class_name;
}

1;
