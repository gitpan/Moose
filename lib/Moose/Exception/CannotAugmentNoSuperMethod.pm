package Moose::Exception::CannotAugmentNoSuperMethod;
$Moose::Exception::CannotAugmentNoSuperMethod::VERSION = '2.1305'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::ParamsHash';

has 'class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

has 'method_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    "You cannot augment '".$self->method_name."' because it has no super method";
}

1;
