package Moose::Exception::Role::InstanceClass;
$Moose::Exception::Role::InstanceClass::VERSION = '2.1305'; # TRIAL
use Moose::Role;

has 'instance_class' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

1;
