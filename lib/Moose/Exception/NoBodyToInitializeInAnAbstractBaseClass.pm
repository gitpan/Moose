package Moose::Exception::NoBodyToInitializeInAnAbstractBaseClass;
$Moose::Exception::NoBodyToInitializeInAnAbstractBaseClass::VERSION = '2.1305'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'package_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    "No body to initialize, " .$self->package_name. " is an abstract base class";
}

1;
