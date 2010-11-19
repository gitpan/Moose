package Moose::Meta::Method::Accessor::Native::Hash::is_empty;

use strict;
use warnings;

use Scalar::Util qw( looks_like_number );

our $VERSION = '1.20';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader' =>
    { -excludes => ['_maximum_arguments'] };

sub _maximum_arguments { 0 }

sub _return_value {
    my $self        = shift;
    my $slot_access = shift;

    return "scalar keys \%{ ($slot_access) } ? 0 : 1";
}

no Moose::Role;

1;
