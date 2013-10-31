package Moose::Exception::MessageParameterMustBeCodeRef;
BEGIN {
  $Moose::Exception::MessageParameterMustBeCodeRef::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Exception::MessageParameterMustBeCodeRef::VERSION = '2.1105'; # TRIAL
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
    "The 'message' parameter must be a coderef";
}

1;
