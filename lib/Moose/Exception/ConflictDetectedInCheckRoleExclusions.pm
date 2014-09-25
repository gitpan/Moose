package Moose::Exception::ConflictDetectedInCheckRoleExclusions;
$Moose::Exception::ConflictDetectedInCheckRoleExclusions::VERSION = '2.1304'; # TRIAL
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role';

has 'excluded_role_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self               = shift;
    my $role_name          = $self->role_name;
    my $excluded_role_name = $self->excluded_role_name;
    return "Conflict detected: $role_name excludes role '$excluded_role_name'";
}

1;
