package Net::WolframAlpha::States;

use 5.008008;
use strict;
use warnings;

require Exporter;

use Net::WolframAlpha::State;
use Net::WolframAlpha::StateList;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Net::WolframAlpha ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '1.0';

sub new {
    my $class = shift;
    my $xmlo = shift;

    my $self = {};

    $self->{'count'} = 0;

    my ($count,$states,$statelists);

    @{$self->{'state'}} = ();
    @{$self->{'statelist'}} = ();

    if ($xmlo) {
	$count = $xmlo->{'count'} || undef;
	$states = $xmlo->{'state'} || undef;
	$statelists = $xmlo->{'statelist'} || undef;

	$self->{'count'} = $count if defined $count;

	if (defined $states) {
	    foreach my $state (@{$states}) {
		push(@{$self->{'state'}}, Net::WolframAlpha::State->new($state));
	    }
	}

	if (defined $statelists) {
	    foreach my $statelist (@{$statelists}) {
		push(@{$self->{'statelist'}}, Net::WolframAlpha::StateList->new($statelist));
	    }
	}
    }


    return(bless($self, $class));
}

sub count {shift->{'count'};}
sub state {shift->{'state'};}
sub statelist {shift->{'statelist'};}

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Net::WolframAlpha::States - Perl object returned via $pod->states

=head1 SYNOPSIS

    if ($pod->states->count) {
      foreach my $state (@{$pod->states->state}) {
        ...
      }

      foreach my $statelist (@{$pod->states->statelist}) {
        ...

      }
    }

=head1 DESCRIPTION


=head2 ATTRIBUTES

$states->count


=head2 SECTOINS

$states->state - array of L<Net::WolframAlpha::State> elements

$states->statelist - array of L<Net::WolframAlpha::StateList> elements


=head2 EXPORT

None by default.


=head1 SEE ALSO

L<Net::WolframAlpha>


=head1 AUTHOR

Gabriel Weinberg, E<lt>yegg@alum.mit.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Gabriel Weinberg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
