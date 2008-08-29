package Moose::Meta::Role::Application::ToMetaclassInstance;

use strict;
use warnings;
use metaclass;

use Scalar::Util 'blessed';

our $VERSION   = '0.55_02';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use base 'Moose::Meta::Role::Application::ToClass';

__PACKAGE__->meta->add_attribute('rebless_params' => (
    reader  => 'rebless_params',
    default => sub { {} }
));

my %ANON_CLASSES;

sub apply {
    my ( $self, $role, $meta ) = @_;

    my $anon_role_key = (blessed($meta) . $role->name);

    my $class;
    if (exists $ANON_CLASSES{$anon_role_key} && defined $ANON_CLASSES{$anon_role_key}) {
        $class = $ANON_CLASSES{$anon_role_key};
    }
    else {
        my $metaclass_class
            = ( ref $meta )->can('create_anon_class')
            ? ref $meta
            : 'Moose::Meta::Class';
        $class = $metaclass_class->create_anon_class(
            superclasses => [ blessed($meta) ],
        );

        $ANON_CLASSES{$anon_role_key} = $class;
        $self->SUPER::apply( $role, $class );
    }

    $class->rebless_instance( $meta, %{ $self->rebless_params } );
}

1;

__END__

=pod

=head1 NAME

Moose::Meta::Role::Application::ToMetaclassInstance - Compose a role into a metaclass instance

=head1 DESCRIPTION

=head2 METHODS

=over 4

=item B<new>

=item B<meta>

=item B<apply>

=item B<rebless_params>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2008 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

