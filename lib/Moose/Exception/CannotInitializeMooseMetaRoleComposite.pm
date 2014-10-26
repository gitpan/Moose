package Moose::Exception::CannotInitializeMooseMetaRoleComposite;
$Moose::Exception::CannotInitializeMooseMetaRoleComposite::VERSION = '2.1307'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'role_composite' => (
    is       => 'ro',
    isa      => 'Moose::Meta::Role::Composite',
    required => 1
);

has 'old_meta' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

has 'args' => (
    is       => 'ro',
    isa      => 'ArrayRef',
    required => 1
);

sub _build_message {
    'Moose::Meta::Role::Composite instances can only be reinitialized from an existing metaclass instance';
}

1;
