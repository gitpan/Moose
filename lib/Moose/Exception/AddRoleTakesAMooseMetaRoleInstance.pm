package Moose::Exception::AddRoleTakesAMooseMetaRoleInstance;
$Moose::Exception::AddRoleTakesAMooseMetaRoleInstance::VERSION = '2.1400';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

has 'role_to_be_added' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1,
);

sub _build_message {
    "Roles must be instances of Moose::Meta::Role";
}

1;
