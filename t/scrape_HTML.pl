#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "\";
my @HTML; 

=begin scrape_HTML
Pass credentials to curl. 
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  return @HTML = (`curl --user ${netid}:${password} $url`);

}

scrape_HTML();
print @HTML;
