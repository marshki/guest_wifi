#!/usr/bin/perl -w
use v5.30;

use strict;
use warnings;
use diagnostics;

#use Test::Simple tests => 1;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
my @HTML;
     
my $ua = LWP::UserAgent->new();

my $req = new HTTP::Request(GET => $url);

our $HTML;

our $first;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);
  return $HTML = $ua->request($req);
}

scrape_HTML();
#print $HTML->as_string();

# ok( @HTML eq @HTML );

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  # return $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML) [0];
  # Perl wants you to use an HTML parser, not Perl, to extract stuff.
  return $first = (split qr{</?td>}, @HTML) [6];
}

sub main() {
  scrape_HTML();
  parse_table();
  print $first;
}

&main();

#ok( @HTML eq @HTML );
#ok( $parse_HTML eq $parse_HTML );
