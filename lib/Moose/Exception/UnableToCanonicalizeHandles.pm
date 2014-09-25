package Moose::Exception::UnableToCanonicalizeHandles;
$Moose::Exception::UnableToCanonicalizeHandles::VERSION = '2.1304'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Attribute';

has 'handles' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1,
);

sub _build_message {
    my $self = shift;
    "Unable to canonicalize the 'handles' option with ".$self->handles;
}

1;
