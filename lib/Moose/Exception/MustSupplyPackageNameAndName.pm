package Moose::Exception::MustSupplyPackageNameAndName;
BEGIN {
  $Moose::Exception::MustSupplyPackageNameAndName::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::MustSupplyPackageNameAndName::VERSION = '2.1101'; # TRIAL
}

use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::ParamsHash';

has 'class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub _build_message {
    my $self = shift;
    "You must supply the package_name and name parameters";
}

1;
