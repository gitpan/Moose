package Moose::Exception::OverloadRequiresAMethodNameOrCoderef;
$Moose::Exception::OverloadRequiresAMethodNameOrCoderef::VERSION = '2.1307'; # TRIAL
use Moose;
extends 'Moose::Exception';

sub _build_message {
    my $self = shift;
    'You must provide a method_name or coderef parameter when constructing a Moose::Meta::Overload object';
}

1;
