package Moose::Exception::Role::RoleForCreateMOPClass;
$Moose::Exception::Role::RoleForCreateMOPClass::VERSION = '2.1302'; # TRIAL
use Moose::Role;
with 'Moose::Exception::Role::ParamsHash';

has 'class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

1;
