package Dist::Zilla::PluginBundle::Author::PERLANCAR::NonCPAN;

# DATE
# VERSION

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Author::PERLANCAR',
        -remove => [qw/Authority ConfirmRelease UploadToCPAN::WWWPAUSESimple/],
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like PERLANCAR when you build your non-CPAN dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::PERLANCAR::NonCPAN]

is equivalent to:

 [@Filter]
 bundle=@Author::PERLANCAR
 remove=Authority
 remove=ConfirmRelease
 remove=UploadToCPAN

(Authority is removed so you can conveniently use this bundle and add the
Authority plugin separately again and set C<authority>, instead of having to
@Filter this bundle and remove Authority only to add it later to customize the
authority.)


=head1 DESCRIPTION

=cut
