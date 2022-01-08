#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

#use Test::Simple tests => 2;

use LWP::UserAgent;
use Mozilla::CA;
use HTML::TableExtract;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
my @HTML;
     
my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
our $HTML;

my $headers = ['Guest ID', 'Password'];
my $table_extract = HTML::TableExtract->new(headers => $headers);

our $credentials;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);

  return $HTML = $ua->request($req)->content();
}

=begin parse_table
Extract, then return region of interest (ROI) from HTML.
=cut

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  $table_extract->parse($HTML);
  my ($table) = $table_extract->tables;

  for my $row ($table->rows) {
    return our $credentials = join(" ", @$row);
  } 
}

sub main() {
  scrape_HTML();
  parse_table();
}

&main();

#ok( @HTML eq @HTML );
#ok( @$row eq @$row);
