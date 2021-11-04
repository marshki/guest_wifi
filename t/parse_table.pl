#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use Test::Simple tests => 2;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
my @HTML;

our $parse_HTML;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";
  return @HTML = (`curl --user ${netid}:${password} $url`);
}

=begin parse_table
Extract region of interest (ROI) from HTML.
=cut

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  return $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML) [0];

}

sub main() {
  scrape_HTML();
  parse_table();
  print $parse_HTML;
}

&main();

ok( @HTML eq @HTML );
ok( $parse_HTML eq $parse_HTML );
