package Dist::Zilla::PluginBundle::Author::PERLANCAR::NonCPAN::Task;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

# AUTHORITY
# DATE
# DIST
# VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Author::PERLANCAR::Task',
        -remove => [qw/PERLANCAR::Authority ConfirmRelease UploadToCPAN/],
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like PERLANCAR when you build your non-CPAN task dists

=for Pod::Coverage ^(configure)$

=head1 SYNOPSIS

 # dist.ini
 [@Author::PERLANCAR::NonCPAN::Task]

is equivalent to:

 [@Filter]
 bundle=@Author::PERLANCAR::Task
 remove=Authority
 remove=ConfirmRelease
 remove=UploadToCPAN


=head1 DESCRIPTION

=cut
