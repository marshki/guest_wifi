#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $password = "";
my @HTML;
our $parse_HTML; 
our $guest_username;
our $guest_password;

=begin parse_guest_username/password
Extract region of interest (username, password) from parse_HTML.
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  return @HTML = (`curl --user ${netid}:${password} $url`);

}

sub parse_table {
  print "Parsing region of interest from HTML... \n"; 

  return $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML)[0];

}

sub extract_guest_username {
  print "Extracting guest username... \n"; 

  $guest_username = (split qr{</?td>}, $parse_HTML)[6];

}

sub extract_guest_password {
  print "Extracting guest password... \n"; 

  $guest_password = (split qr{</?pre>}, $parse_HTML)[1];

}

sub main() {
  scrape_HTML();
  parse_table(); 
  extract_guest_username();
  extract_guest_password();
  print "Guest username: $guest_username \n" ; 
  print "Guest password: $guest_password \n" ; 
}

&main();
