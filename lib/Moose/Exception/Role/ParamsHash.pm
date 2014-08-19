package Moose::Exception::Role::ParamsHash;
$Moose::Exception::Role::ParamsHash::VERSION = '2.1301'; # TRIAL
use Moose::Role;

has 'params' => (
    is       => 'ro',
    isa      => 'HashRef',
    required => 1,
);

1;
