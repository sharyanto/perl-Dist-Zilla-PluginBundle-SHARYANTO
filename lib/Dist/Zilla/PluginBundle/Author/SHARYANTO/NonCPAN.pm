package Dist::Zilla::PluginBundle::Author::SHARYANTO::NonCPAN;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Author::SHARYANTO',
        -remove => [qw/ConfirmRelease MetaJSON MetaYAML UploadToCPAN/],
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your non-CPAN dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::SHARYANTO::NonCPAN]

is equivalent to:

 [@Filter]
 bundle=@Author::SHARYANTO
 remove=ConfirmRelease
 remove=MetaJSON
 remove=MetaYAML
 remove=UploadToCPAN


=head1 DESCRIPTION

=cut
