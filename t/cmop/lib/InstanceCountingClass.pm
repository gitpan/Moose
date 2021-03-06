package # hide the package from PAUSE
    InstanceCountingClass;

use strict;
use warnings;

our $VERSION = '0.03';

use parent 'Class::MOP::Class';

InstanceCountingClass->meta->add_attribute('count' => (
    reader  => 'get_count',
    default => 0
));

InstanceCountingClass->meta->add_before_method_modifier('_construct_instance' => sub {
    my ($class) = @_;
    $class->{'count'}++;
});

1;

__END__

=pod

=head1 NAME

InstanceCountingClass - An example metaclass which counts instances

=head1 SYNOPSIS

  package Foo;

  use metaclass 'InstanceCountingClass';

  sub new  {
      my $class = shift;
      $class->meta->new_object(@_);
  }

  # ... meanwhile, somewhere in the code

  my $foo = Foo->new();
  print Foo->meta->get_count(); # prints 1

  my $foo2 = Foo->new();
  print Foo->meta->get_count(); # prints 2

  # ... etc etc etc

=head1 DESCRIPTION

This is a classic example of a metaclass which keeps a count of each
instance which is created.

=head1 AUTHORS

Stevan Little E<lt>stevan@iinteractive.comE<gt>

Yuval Kogman E<lt>nothingmuch@woobling.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2008 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
