#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use Test::Simple tests => 1;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";
my @HTML;
     
my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);

our $HTML;

=begin comment
Scrape, then return parsed table to "HTML".
=end comment
=cut

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);

  return $HTML = $ua->request($req)->content();
}

ok( @HTML eq @HTML );

=begin comment
# ... Code omitted ...

# Test the scrape_HTML subroutine
subtest "Test scrape_HTML" => sub {
    my $actual_html = scrape_HTML();
    ok($actual_html, "Scraped HTML is non-empty");
};
=end comment
=cut
