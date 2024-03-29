package Net::WolframAlpha::Subpod;

use 5.008008;
use strict;
use warnings;

require Exporter;

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

    my ($title,$plaintext,$img,$minput,$moutput,$mathml);

    if ($xmlo) {
	$title = $xmlo->{'title'} || undef;
	$plaintext = $xmlo->{'plaintext'} || undef;
	$img = $xmlo->{'img'} || undef;
	$minput = $xmlo->{'minput'} || undef;
	$moutput = $xmlo->{'moutput'} || undef;
	$mathml = $xmlo->{'mathml'} || undef;

	$self->{'title'} = $title if defined $title;
	$self->{'plaintext'} = $plaintext if defined $plaintext;
	$self->{'minput'} = $minput if defined $minput;
	$self->{'moutput'} = $moutput if defined $moutput;
	$self->{'mathml'} = $mathml if defined $mathml;

	if (defined $img) {
	    my $html = '<img';
	    foreach my $attr (keys %{$img}) {
		$html .= ' ' . $attr . '=\'' . $img->{$attr} . '\'';
	    }
	    $html .= '/>';
	    $self->{'img'} = $html;
	}
    }

    return(bless($self, $class));
}

sub title {shift->{'title'};}
sub plaintext {shift->{'plaintext'};}
sub img {shift->{'img'};}
sub minput {shift->{'minput'};}
sub moutput {shift->{'moutput'};}
sub mathml {shift->{'mathml'};}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Net::WolframAlpha::Subpod - Perl objects accessed via $pod->subpods

=head1 SYNOPSIS

        foreach my $subpod (@{$pod->subpods}) {
            print "  Subpod\n";
            print '    plaintext: ', $subpod->plaintext, "\n" if $subpod->plaintext;
            print '    title: ', $subpod->title, "\n" if $subpod->title;
            print '    minput: ', $subpod->minput, "\n" if $subpod->minput;
            print '    moutput: ', $subpod->moutput, "\n" if $subpod->moutput;
            print '    mathml: ', $subpod->mathml, "\n" if $subpod->mathml;
            print '    img: ', $subpod->img, "\n" if $subpod->img;
        }

=head1 DESCRIPTION


=head2 ATTRIBUTES

$subpod->plaintext

$subpod->title

$subpod->minput

$subpod->moutput

$subpod->mathml

$sbupod->img
    

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
