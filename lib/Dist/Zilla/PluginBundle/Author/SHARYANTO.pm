package Dist::Zilla::PluginBundle::Author::SHARYANTO;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Classic',
        -remove => [qw/PkgVersion PodVersion Readme/],
    });

    $self->add_plugins(
        'Author::SHARYANTO::MetaResources',
        'CheckChangeLog',
        'CheckMetaResources',
        'MetaJSON',
        'MetaConfig',
        'OurPkgVersion',
        'PodWeaver',
        'ReadmeFromPod',
        'Rinci::Validate',
        'Test::Compile',
        'Test::Rinci',

        [InstallRelease => {install_command => 'cpanm -n .'}],
        # to help make sure that I have the latest plugins
        ['Run::BeforeBuild' => {run => 'exec-if-not-env SHARYANTO_SKIP_UPDATE_BUNDLE norepeat -p daily -- cpanm -n --reinstall Dist::Zilla::PluginBundle::Author::SHARYANTO Pod::Weaver::PluginBundle::Author::SHARYANTO'}],
        ['Run::Release' => {run => 'archive-perl-release %s'}],
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::SHARYANTO]

is equivalent to (see source).


=head1 DESCRIPTION

The gist:

I avoid stuffs that might change line numbers (so OurPkgVersion instead of
PkgVersion, etc). I also always add #ABSTRACT, #PODNAME, and POD at the end of
file).

I still maintain dependencies and increase version number manually (so no
AutoVersion and AutoPrereqs).

I install my dists after release (the eat-your-own-dog-food principle). I also
archive them using a script called C<archive-perl-release>. This is currently a
script on my computer, you can get them from my 'scripts' github repo but this
is optional and the release process won't fail if the script does not exist.

=cut
