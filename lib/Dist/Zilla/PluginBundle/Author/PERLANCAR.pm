package Dist::Zilla::PluginBundle::Author::PERLANCAR;

# DATE
# VERSION

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Classic',
        -remove => [qw/PkgVersion PodVersion Readme UploadToCPAN/],
    });

    $self->add_plugins(
        'Rinci::AbstractFromMeta',
        'PodnameFromFilename',
        #'PERLANCAR::CheckDepDists', # 2016-03-16 disabled because it slows down building process, i'll do this occasionally later
        'PERLANCAR::EnsurePrereqToSpec',
        'PERLANCAR::MetaResources',
        'CheckChangeLog',
        'CheckMetaResources',
        'IfBuilt',
        'MetaJSON',
        'MetaConfig',
        'GenShellCompletion',
        ['Authority' => {locate_comment=>1}],
        'OurDate',
        'OurDist',
        'PERLANCAR::OurPkgVersion',
        'PodWeaver',
        ['PruneFiles' => {match => ['~$', '^nytprof.*']}],
        'ReadmeFromPod',
        'Rinci::AddPrereqs',
        'Rinci::AddToDb',
        'Rinci::Validate',
        'SetScriptShebang',
        'Test::Compile',
        'Test::Rinci',
        'UploadToCPAN::WWWPAUSESimple',
        'EnsureSQLSchemaVersionedTest',
        ['Acme::CPANLists::Blacklist' => {module_list=>[q[PERLANCAR::Avoided::Modules I'm currently avoiding]]}],
        'Prereqs::EnsureVersion',
        'Prereqs::CheckCircular',
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like PERLANCAR when you build your dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::PERLANCAR]

is equivalent to (see source).


=head1 DESCRIPTION

The gist:

I avoid stuffs that might change line numbers (so OurPkgVersion instead of
PkgVersion, etc). I also always add #ABSTRACT, #PODNAME, and POD at the end of
file).

I still maintain dependencies and increase version number manually (so no
AutoVersion and AutoPrereqs).

I install my dists after release (the eat-your-own-dog-food principle), except
when INSTALL=0 environment is specified. I also archive them using a script
called C<archive-perl-release>. This is currently a script on my computer, you
can get them from my 'scripts' github repo but this is optional and the release
process won't fail if the script does not exist.

=cut
