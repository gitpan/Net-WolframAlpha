package Net::WolframAlpha::Query;

use 5.008008;
use strict;
use warnings;

require Exporter;

use  Net::WolframAlpha::Assumptions;
use  Net::WolframAlpha::Sources;
use  Net::WolframAlpha::Pod;
use  Net::WolframAlpha::Warnings;
use  Net::WolframAlpha::Didyoumeans;
use  Net::WolframAlpha::Error;

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

    my %options = @_;

    my $self = {};
    while(my($key, $val) = each %options) {
	my $lkey = lc($key);
	$self->{$lkey} = $val;
    }

    my ($timing,$parsetiming,$numpods,$assumptions,$pods,$timedout,$datatypes,$css,$scripts,$sources,$warnings,$didyoumeans,$success,$error);

    @{$self->{'assumptions'}} = ();
    @{$self->{'pods'}} = ();
    @{$self->{'sources'}} = ();
    @{$self->{'warnings'}} = ();
    @{$self->{'didyoumeans'}} = ();

    $self->{'success'} = 0;
    $self->{'error'} = 1;

    if ($self->{'xmlo'}) {
	$timing = $self->{'xmlo'}->{'timing'} || undef;
	$parsetiming = $self->{'xmlo'}->{'parsetiming'} || undef;
	$numpods = $self->{'xmlo'}->{'numpods'} || undef;
	$assumptions = $self->{'xmlo'}->{'assumptions'} || undef;
	$pods = $self->{'xmlo'}->{'pod'} || undef;
	$timedout = $self->{'xmlo'}->{'timedout'} || undef;
	$datatypes = $self->{'xmlo'}->{'datatypes'} || undef;
	$css = $self->{'xmlo'}->{'css'} || undef;
	$scripts = $self->{'xmlo'}->{'scripts'} || undef;
	$sources = $self->{'xmlo'}->{'sources'} || undef;
	$warnings = $self->{'xmlo'}->{'warnings'} || undef;
	$didyoumeans = $self->{'xmlo'}->{'didyoumeans'} || undef;
	$success = $self->{'xmlo'}->{'success'} || undef;
	$error = $self->{'xmlo'}->{'error'} || undef;

	$self->{'timing'} = $timing if defined $timing;
	$self->{'parsetiming'} = $parsetiming if defined $parsetiming;
	$self->{'numpods'} = $numpods if defined $numpods;
	$self->{'timedout'} = $timedout if defined $timedout;
	$self->{'datatypes'} = $datatypes if defined $datatypes;
	$self->{'css'} = $css if defined $css;
	$self->{'scripts'} = $scripts if defined $scripts;

	if (defined $success && $success eq 'true') {
	    $self->{'success'} = 1;
	}

	if (defined $error && $error eq 'false') {
	    $self->{'error'} = 0;
	} elsif (defined $error && $error ne 'false') {
	    $self->{'error'} = Net::WolframAlpha::Error->new($error);

	}

	foreach my $pod (@{$pods}) {
	    push(@{$self->{'pods'}}, Net::WolframAlpha::Pod->new($pod));
	}
    }

    $self->{'assumptions'} = Net::WolframAlpha::Assumptions->new($assumptions);
    $self->{'sources'} = Net::WolframAlpha::Sources->new($sources);
    $self->{'warnings'} = Net::WolframAlpha::Warnings->new($warnings);
    $self->{'didyoumeans'} = Net::WolframAlpha::Didyoumeans->new($didyoumeans);

    return(bless($self, $class));
}

sub xml {shift->{'xml'};}
sub success {shift->{'success'};}
sub error {shift->{'error'};}
sub xmlo {shift->{'xmlo'};}
sub timing {shift->{'timing'};}
sub parsetiming {shift->{'parsetiming'};}
sub assumptions {shift->{'assumptions'};}
sub numpods {shift->{'numpods'};}
sub pods {shift->{'pods'};}
sub timedout {shift->{'timedout'};}
sub datatypes {shift->{'datatypes'};}
sub css {shift->{'css'};}
sub scripts {shift->{'scripts'};}
sub sources {shift->{'sources'};}
sub warnings {shift->{'warnings'};}
sub didyoumeans {shift->{'didyoumeans'};}

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Net::WolframAlpha::Query - Perl object returned via $wa->query


=head1 SYNOPSIS

my $query = $wa->query(
    input => $input,
    assumption => '*C.pi-_*Movie-',
    );	

if ($query->success) {
  foreach my $pod (@{$query->pods}) {
    if (!$pod->error) {
      foreach my $subpod (@{$pod->subpods}) {
          ...
      }
    }
  }

  if ($query->warnings->count) {
    ...
  }

 }


=head1 DESCRIPTION

=head2 SUCCESS

$query->success - 0/1, tells whether it was successful or not

$query->error - 0 or L<Net::WolframAlpha::Error>, tells whether there was an error or not


=head2 ATTRIBUTES

$query->timing 

$query->parsetiming

$query->timedout

$query->numpods

$query->css

$query->scripts

$query->datatypes


=head2 SECTOINS

$query->pods - array of L<Net::WolframAlpha::Pod> elements

$query->assumptions - L<Net::WolframAlpha::Assumptions> object

$query->warnings - L<Net::WolframAlpha::Warnings> object

$query->sources - L<Net::WolframAlpha::Sources> object

$query->didyoumeans - L<Net::WolframAlpha::Didyoumean> object


=head2 DEBUGGING

$query->xml - raw XML

$query->xmlo - raw XML::Simple object


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
