package Dist::Zilla::PluginBundle::SHARYANTO::Task;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@SHARYANTO',
        -remove => [qw/PodCoverageTests PodSyntaxTests PodWeaver/],
    });

    $self->add_plugins(
        'TaskWeaver',
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your task dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@SHARYANTO::Task]

is equivalent to:

 [@Filter]
 bundle=@SHARYANTO
 remove=PodCoverageTests
 remove=PodSyntaxTests
 remove=PodWeaver

 [TaskWeaver]


=head1 DESCRIPTION

=cut
