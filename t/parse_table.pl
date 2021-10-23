#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $password = "";
my @HTML;
our $parsed_table; 

=begin parse_table
Extract region of interest (ROI) from HTML.
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  return @HTML = (`curl --user ${netid}:${password} $url`);

}

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n"; 

  return $parsed_table = (grep { /table.*Guest.*Password/ } @HTML)[0];

}

sub main() {
  scrape_HTML();
  parse_table(); 

}

&main();
