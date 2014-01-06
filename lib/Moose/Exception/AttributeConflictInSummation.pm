package Moose::Exception::AttributeConflictInSummation;
BEGIN {
  $Moose::Exception::AttributeConflictInSummation::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::AttributeConflictInSummation::VERSION = '2.1200';
}

use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role', 'Moose::Exception::Role::AttributeName';

has 'second_role' => (
    is         => 'ro',
    isa        => 'Moose::Meta::Role',
    required   => 1,
);

sub _build_message {
    my $self = shift;

    my $role1 = $self->role_name;
    my $role2 = $self->second_role->name;
    my $attr_name = $self->attribute_name;

    return "We have encountered an attribute conflict with '$attr_name'"
           . " during role composition. "
           . " This attribute is defined in both $role1 and $role2."
           . " This is a fatal error and cannot be disambiguated.";
}

1;
