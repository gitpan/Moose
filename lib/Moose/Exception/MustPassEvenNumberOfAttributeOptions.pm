package Moose::Exception::MustPassEvenNumberOfAttributeOptions;
$Moose::Exception::MustPassEvenNumberOfAttributeOptions::VERSION = '2.1304'; # TRIAL
use Moose;
extends 'Moose::Exception';

has 'options' => (
    is       => 'ro',
    isa      => 'ArrayRef',
    required => 1
);

has 'attribute_name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

sub _build_message {
    return 'You must pass an even number of attribute options';
}

1;
