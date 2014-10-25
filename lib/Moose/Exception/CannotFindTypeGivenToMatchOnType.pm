package Moose::Exception::CannotFindTypeGivenToMatchOnType;
$Moose::Exception::CannotFindTypeGivenToMatchOnType::VERSION = '2.1306'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'to_match' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

has 'action' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

has 'type' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

sub _build_message {
    my $self = shift;
    my $type = $self->type;

    return "Cannot find or parse the type '$type'"
}

1;
