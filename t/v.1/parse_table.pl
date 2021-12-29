#!/usr/bin/perl -w
use v5.30;

use strict;
use warnings;
use diagnostics;

#use Test::Simple tests => 1;

use LWP::UserAgent;
use Mozilla::CA;
use HTML::TableExtract;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

#my @HTML;
our $parse_HTML;
     
my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
use HTML::TableExtract;

our $HTML;

#
#$table_extract->parse_file('sample.html');
#my ($table) = $table_extract->tables;
#for my $row ($table->rows) {
#    print join(",", @$row), "\n";
#

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);
  return $HTML = $ua->request($req);
}

scrape_HTML();
$HTML->as_string();
#print $HTML->as_string();

# ok( @HTML eq @HTML );
my $headers = ['Guest ID', 'Password'];

my $table_extract = HTML::TableExtract->new(headers => $headers);

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  $table_extract->parse($HTML);
  my ($table) = $table_extract->tables;

  for my $row ($table->rows) {
      print join(",", @$row), "\n";
  }
}

parse_table();

#sub main() {
#scrape_HTML();
  #parse_table();
  #print $parse_HTML;
  #}

#my $headers = ['Guest ID', 'Password'];
#my $table_extract = HTML::TableExtract->new(headers => $headers);

#$table_extract->parse($HTML);
#my ($table) = $table_extract->tables;
#for my $row ($table->rows) {
#  print join(",", @$row), "\n";
#};

#&main();

#ok( @HTML eq @HTML );
#ok( $parse_HTML eq $parse_HTML );
