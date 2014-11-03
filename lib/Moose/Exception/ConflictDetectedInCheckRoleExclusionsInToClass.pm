package Moose::Exception::ConflictDetectedInCheckRoleExclusionsInToClass;
$Moose::Exception::ConflictDetectedInCheckRoleExclusionsInToClass::VERSION = '2.1401';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class', 'Moose::Exception::Role::Role';

sub _build_message {
    my $self       = shift;
    my $class_name = $self->class_name;
    my $role_name  = $self->role_name;
    return "Conflict detected: $class_name excludes role '$role_name'";
}

1;
