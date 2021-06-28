#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "" ;
my $password = "" ;

=begin parse_HTML
Extract region of interest (table) from HTML.
=cut

sub retrieve_HTML {
  print "Retrieving HTML from NYUROAM page... \n";

  our $HTML = (`curl --user ${netid}:${password} $url`) ;
 
}

sub parse_table {
  print "Parsing HTML from NYUROAM page... \n";

  our $HTML_table = (grep { /table.*Guest.*Password/ } $HTML)[0];

  print "$HTML_table"; 
}


sub main() {

  retrieve_HTML();
  parse_table();
}

&main();
