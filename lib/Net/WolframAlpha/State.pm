package Net::WolframAlpha::State;

use 5.008008;
use strict;
use warnings;

require Exporter;

use Net::WolframAlpha::AssumptionValue;

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

    my ($name);

    if ($xmlo) {
	$name = $xmlo->{'name'} || undef;

	$self->{'name'} = $name if defined $name;
    }

    return(bless($self, $class));
}

sub name {shift->{'name'};}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Net::WolframAlpha::State - Perl objects accessed via $pod->(?:states|statelist)->state

=head1 SYNOPSIS

    foreach my $state (@{$pod->states->state}) {
      print "    name: ", $state->name, "\n";
    }


=head1 DESCRIPTION


=head2 ATTRIBUTES

$state->name


=head1 SEE ALSO

Net::WolframAlpha

=head1 AUTHOR

Gabriel Weinberg, E<lt>yegg@alum.mit.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Gabriel Weinberg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
