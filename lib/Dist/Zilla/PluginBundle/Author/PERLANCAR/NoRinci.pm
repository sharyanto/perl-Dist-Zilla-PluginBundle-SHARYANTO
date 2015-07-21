package Dist::Zilla::PluginBundle::Author::PERLANCAR::NoRinci;

# DATE
# VERSION

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Author::PERLANCAR',
        -remove => [qw/Rinci::AbstractFromMeta Rinci::AddPrereqs Rinci::Validate Test::Rinci/],
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like PERLANCAR when you build your non-Rinci dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::PERLANCAR::NonRinci]

is equivalent to:

 [@Filter]
 bundle=@Author::PERLANCAR
 remove=Rinci::AbstractFromMeta
 remove=Rinci::AddPrereqs
 remove=Rinci::Validate
 remove=Test::Rinci

=head1 DESCRIPTION

=cut
