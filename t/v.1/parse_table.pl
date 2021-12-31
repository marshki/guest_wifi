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

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);

  return $HTML = $ua->request($req)->content();
}

scrape_HTML();

my $headers = ['Guest ID', 'Password'];

my $table_extract = HTML::TableExtract->new(headers => $headers);

$table_extract->parse($HTML);

my ($table) = $table_extract->tables;


for my $row ($table->rows) {
    print join(" ", @$row), "\n";
}

###############
# Placeholders:
#sub main() {
#scrape_HTML();
  #parse_table();
  #}
#&main();

#ok( @HTML eq @HTML );
#ok( $parse_HTML eq $parse_HTML );

#ok( @HTML eq @HTML );
