package Moose::Exception::ClassDoesTheExcludedRole;
BEGIN {
  $Moose::Exception::ClassDoesTheExcludedRole::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::ClassDoesTheExcludedRole::VERSION = '2.1103'; # TRIAL
}

use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role', 'Moose::Exception::Role::Class';

has 'excluded_role' => (
    is       => 'ro',
    isa      => 'Moose::Meta::Role',
    required => 1
);

sub _build_message {
    my $self = shift;
    "The class " . $self->class_name . " does the excluded role '".$self->excluded_role->name."'";
}

1;
