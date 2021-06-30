#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "" ;
my $password = "" ;

=begin retrieve_HTML
Pass credentials to curl, assigining extracted page to $HTML.
=cut

sub retrieve_HTML {
  print "Retrieving HTML from NYUROAM page... \n" ;

  my $HTML = (`curl --user ${netid}:${password} $url`) ;

}

retrieve_HTML();
