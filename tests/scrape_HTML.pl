#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

=begin scrape_HTML
Pass credentials to curl. Scrape, then assign page to HTML.
=cut

sub scrape_HTML {
  print "Retrieving HTML from NYUROAM page... \n";

  return my $HTML = (`curl --user ${netid}:${password} $url`);

}

scrape_HTML();
