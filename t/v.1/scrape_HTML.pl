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

my $ua = LWP::UserAgent->new();
my $req = HTTP::Request->new(GET => $url);

our $HTML;

sub scrape_HTML {

    print "Scraping HTML from NYUROAM page... \n";

    $req->authorization_basic($netid, $password);

    return $HTML = $ua->request($req)->content();
}

my $actual_html = scrape_HTML();
ok($actual_html, "Scraped HTML is non-empty.");
