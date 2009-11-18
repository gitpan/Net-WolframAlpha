package Net::WolframAlpha::StateList;

use 5.008008;
use strict;
use warnings;

require Exporter;

use Net::WolframAlpha::State;

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

    my ($count,$states,$value);

    @{$self->{'state'}} = ();

    if ($xmlo) {
	$count = $xmlo->{'count'} || undef;
	$states = $xmlo->{'state'} || undef;
	$value = $xmlo->{'value'} || undef;

	$self->{'count'} = $count if defined $count;
	$self->{'value'} = $value if defined $value;

	if (defined $states) {
	    foreach my $state (@{$states}) {
		push(@{$self->{'state'}}, Net::WolframAlpha::State->new($state));
	    }
	}
    }


    return(bless($self, $class));
}

sub count {shift->{'count'};}
sub state {shift->{'state'};}
sub value {shift->{'value'};}

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Net::WolframAlpha::StateList - Perl objects returned via $pod->states->statelist

=head1 SYNOPSIS

  foreach my $statelist (@{$pod->states->statelist}) {
    print "    statelist: ", $statelist->value, "\n";
    foreach my $state (@{$statelist->state}) {
      ...
    }
  }

=head1 DESCRIPTION


=head2 ATTRIBUTES

$statelist->value


=head2 SECTOINS

$statelist->state - array of L<Net::WolframAlpha::State> elements


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
