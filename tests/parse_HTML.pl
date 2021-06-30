#!/usr/bin/perl
# "parsing" may be a better variable name

use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $password = "";
my @HTML;
our $parse_HTML; 

=begin parse_HTML
Extract region of interest (ROI) from HTML.
=cut

sub retrieve_HTML {
  print "Retrieving HTML from NYUROAM page... \n";

  @HTML = (`curl --user ${netid}:${password} $url`);

}

sub parse_HTML {
  print "Parsing region of interest from HTML... \n"; 

  $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML)[0];

}

sub main() {
  retrieve_HTML();
  parse_HTML(); 

}

&main();
