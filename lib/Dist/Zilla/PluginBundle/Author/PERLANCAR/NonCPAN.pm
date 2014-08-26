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
        -remove => [qw/ConfirmRelease UploadToCPAN/],
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
 remove=ConfirmRelease
 remove=MetaJSON
 remove=MetaYAML
 remove=UploadToCPAN


=head1 DESCRIPTION

=cut
