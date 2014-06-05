package Moose::Exception::MetaclassIsARoleNotASubclassOfGivenMetaclass;
BEGIN {
  $Moose::Exception::MetaclassIsARoleNotASubclassOfGivenMetaclass::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Exception::MetaclassIsARoleNotASubclassOfGivenMetaclass::VERSION = '2.1209';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role';

use Moose::Util 'find_meta';

has 'metaclass' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    my $role_name = $self->role_name;
    my $role      = find_meta( $role_name );
    my $metaclass = $self->metaclass;
    return "$role_name already has a metaclass, but it does not inherit $metaclass ($role). "
        ."You cannot make the same thing a role and a class. Remove either Moose or Moose::Role.";
}

1;
