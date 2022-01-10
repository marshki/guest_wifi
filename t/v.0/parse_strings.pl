#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

use Test::Simple tests => 4;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
my @HTML;

our $parse_HTML;

our $guest_username;
our $guest_password;

=begin scrape_HTML
Scrape, then return parsed table to "HTML".
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";
  return @HTML = (`curl --user ${netid}:${password} $url`);
}

=begin parse_table
Extract region of interest (ROI) from HTML.
=cut

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  return $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML) [0];

}

=begin parse_guest_username/password
Extract region of interest (username, password) from parse_HTML.
=cut

sub parse_guest_username {
  print "Parsing guest username... \n"; 

  $guest_username = (split qr{</?td>}, $parse_HTML)[6];

}

sub parse_guest_password {
  print "Parsing guest password... \n"; 

  $guest_password = (split qr{</?pre>}, $parse_HTML)[1];

}

sub main() {
  scrape_HTML();
  parse_table(); 
  parse_guest_username();
  parse_guest_password();
}

&main();

ok( @HTML eq @HTML );
ok( $parse_HTML eq $parse_HTML );
ok( $guest_username eq $guest_username );
ok( $guest_password eq $guest_password );
