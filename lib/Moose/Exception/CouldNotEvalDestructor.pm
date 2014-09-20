package Moose::Exception::CouldNotEvalDestructor;
$Moose::Exception::CouldNotEvalDestructor::VERSION = '2.1303'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'method_destructor_object' => (
    is       => 'ro',
    isa      => 'Moose::Meta::Method::Destructor',
    required => 1
);

has 'source' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

has 'error' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    my $error = $self->error;
    my $source = $self->source;

    return "Could not eval the destructor :\n\n$source\n\nbecause :\n\n$error";
}

1;
