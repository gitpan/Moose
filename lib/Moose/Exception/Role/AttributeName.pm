package Moose::Exception::Role::AttributeName;
$Moose::Exception::Role::AttributeName::VERSION = '2.1401';
use Moose::Role;

has 'attribute_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

1;
