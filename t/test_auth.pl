#!/usr/bin/perl -w
# For reference: https://metacpan.org/pod/LWP::UserAgent

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use HTTP::Request::Common;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
     
my $ua = LWP::UserAgent->new();
my $request = GET $url;

my $netid = "\";
my $password = "\";
my @HTML;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  return @HTML = ($request->authorization_basic($netid, $password));

}
   
scrape_HTML();
  
#my $response = $ua->request($request);
#say $response->as_string();
