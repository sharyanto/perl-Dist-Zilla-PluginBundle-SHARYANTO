package Dist::Zilla::PluginBundle::SHARYANTO::Private;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@SHARYANTO',
        -remove => [qw/ConfirmRelease MetaJSON MetaYAML UploadToCPAN/],
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your private dists

=head1 SYNOPSIS

 # dist.ini
 [@SHARYANTO::Private]

is equivalent to:

 [@Filter]
 bundle=@SHARYANTO
 remove=ConfirmRelease
 remove=UploadToCPAN


=head1 DESCRIPTION

=cut
