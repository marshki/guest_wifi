#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
     
my $ua = LWP::UserAgent->new();

my $req = new HTTP::Request(GET => $url);

my $response;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);
  return $response = $ua->request($req);
}

scrape_HTML();
  
print $response->as_string();
