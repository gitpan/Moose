package Moose::Exception::InvalidArgumentsToTraitAliases;
BEGIN {
  $Moose::Exception::InvalidArgumentsToTraitAliases::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Exception::InvalidArgumentsToTraitAliases::VERSION = '2.1203';
use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

use Scalar::Util qw(reftype);

has 'alias' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1
);

has 'package_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    my $alias = $self->alias;
    my $reftype_alias = reftype($alias);

    return "$reftype_alias references are not "
        . "valid arguments to the 'trait_aliases' option";
}

1;
