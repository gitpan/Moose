package Moose::Exception::Role::AttributeName;
BEGIN {
  $Moose::Exception::Role::AttributeName::AUTHORITY = 'cpan:STEVAN';
}
$Moose::Exception::Role::AttributeName::VERSION = '2.1300'; # TRIAL
use Moose::Role;

has 'attribute_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

1;
