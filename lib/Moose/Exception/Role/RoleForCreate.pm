package Moose::Exception::Role::RoleForCreate;
$Moose::Exception::Role::RoleForCreate::VERSION = '2.1305'; # TRIAL
use Moose::Role;
with 'Moose::Exception::Role::ParamsHash';

has 'attribute_class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

1;
