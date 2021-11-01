#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use Test::Simple tests => 1;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "\";
my @HTML; 

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  return @HTML = (`curl --user ${netid}:${password} $url`);

}

scrape_HTML();

ok( @HTML eq @HTML );
