package Moose::Exception::Role::RoleForCreate;
BEGIN {
  $Moose::Exception::Role::RoleForCreate::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::Role::RoleForCreate::VERSION = '2.1101'; # TRIAL
}

use Moose::Role;
with 'Moose::Exception::Role::ParamsHash';

has 'attribute_class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

1;

