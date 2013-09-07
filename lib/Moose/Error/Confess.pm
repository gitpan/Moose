package Moose::Error::Confess;
BEGIN {
  $Moose::Error::Confess::AUTHORITY = 'cpan:STEVAN';
}
{
  $Moose::Error::Confess::VERSION = '2.1100'; # TRIAL
}

use strict;
use warnings;

use base qw(Moose::Error::Default);

sub new {
    my ( $self, @args ) = @_;
    $self->create_error_confess(@args);
}

sub _inline_new {
    my ( $self, %args ) = @_;

    my $depth = ($args{depth} || 0) - 1;
    return 'Moose::Error::Util::create_error_confess('
      . 'message => ' . $args{message} . ', '
      . 'depth   => ' . $depth         . ', '
  . ')';
}

__PACKAGE__->meta->make_immutable(
    inline_constructor => 0,
    inline_accessors   => 0,
);

1;

# ABSTRACT: Prefer C<confess>

__END__

=pod

=head1 NAME

Moose::Error::Confess - Prefer C<confess>

=head1 VERSION

version 2.1100

=head1 SYNOPSIS

    # Metaclass definition must come before Moose is used.
    use metaclass (
        metaclass => 'Moose::Meta::Class',
        error_class => 'Moose::Error::Confess',
    );
    use Moose;
    # ...

=head1 DESCRIPTION

This error class uses L<Carp/confess> to raise errors generated in your
metaclass.

=head1 AUTHORS

=over 4

=item *

Stevan Little <stevan.little@iinteractive.com>

=item *

Dave Rolsky <autarch@urth.org>

=item *

Jesse Luehrs <doy@tozt.net>

=item *

Shawn M Moore <code@sartak.org>

=item *

Yuval Kogman <nothingmuch@woobling.org>

=item *

Karen Etheridge <ether@cpan.org>

=item *

Florian Ragwitz <rafl@debian.org>

=item *

Hans Dieter Pearcey <hdp@weftsoar.net>

=item *

Chris Prather <chris@prather.org>

=item *

Matt S Trout <mst@shadowcat.co.uk>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Infinity Interactive, Inc..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
