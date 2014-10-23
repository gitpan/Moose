package Moose::Exception::Role::Instance;
$Moose::Exception::Role::Instance::VERSION = '2.1305'; # TRIAL
use Moose::Role;

has 'instance' => (
    is       => 'ro',
    isa      => 'Object',
    required => 1,
);

1;
