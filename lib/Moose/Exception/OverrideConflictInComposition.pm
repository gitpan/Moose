package Moose::Exception::OverrideConflictInComposition;
BEGIN {
  $Moose::Exception::OverrideConflictInComposition::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Exception::OverrideConflictInComposition::VERSION = '2.1204';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Role';

has 'role_being_applied' => (
    is       => 'ro',
    isa      => 'Moose::Meta::Role',
    required => 1
);

has 'method_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

has 'two_overrides_found' => (
    is       => 'ro',
    isa      => 'Bool',
    required => 1,
    default  => 0
);

sub _build_message {
    my $self = shift;

    if( $self->two_overrides_found ) {
        return "Role '" . $self->role_being_applied->name . "' has encountered an 'override' method conflict " .
               "during composition (Two 'override' methods of the same name encountered). " .
               "This is fatal error.";
    }
    else {
        return "Role '".$self->role_being_applied->name."' has encountered an 'override' method conflict ".
               "during composition (A local method of the same name as been found). ".
               "This is a fatal error.";
    }
}

1;
