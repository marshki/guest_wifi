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
     
my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);

our $HTML;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);
  return $HTML = $ua->request($req);
}

scrape_HTML();

#$HTML->as_string();
#print $HTML->as_string();

my $headers = ['Guest ID', 'Password'];
my $table_extract = HTML::TableExtract->new(headers => $headers);

# I think there's a problem here:

$table_extract->parse($HTML);

#Things def. break here:

print(my ($table) = $table_extract->tables);


#for my $row ($table->rows) {
#  print join(",", @$row), "\n";
#};

###############
# Placeholders:
#sub main() {
#scrape_HTML();
  #parse_table();
  #}
#&main();

#ok( @HTML eq @HTML );
#ok( $parse_HTML eq $parse_HTML );
