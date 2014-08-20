package Moose::Exception::AttachToClassNeedsAClassMOPClassInstanceOrASubclass;
$Moose::Exception::AttachToClassNeedsAClassMOPClassInstanceOrASubclass::VERSION = '2.1302'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Attribute';

has 'class' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

sub _build_message {
    "You must pass a Class::MOP::Class instance (or a subclass)";
}

1;
