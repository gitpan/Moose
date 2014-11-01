package Moose::Exception::OverloadRequiresAnOperator;
$Moose::Exception::OverloadRequiresAnOperator::VERSION = '2.1400';
use Moose;
extends 'Moose::Exception';

sub _build_message {
    my $self = shift;
    'You must provide an operator parameter when constructing a Moose::Meta::Overload object';
}

1;
