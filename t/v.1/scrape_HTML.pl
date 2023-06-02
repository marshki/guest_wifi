#!/usr/bin/perl

use v5.30;
use strict;
use warnings;

use Test::Simple tests => 1;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = '';
my $password = '';

my $ua = LWP::UserAgent->new();
my $req = HTTP::Request->new(GET => $url);

our $HTML;

=begin comment
Die (quit) if URL is not reachable due to:
- invalid credentials
- host unreachable (offline, out-of-network)
=end comment
=cut

sub scrape_HTML {

    print "Scraping HTML from NYUROAM page... \n";

    $req->authorization_basic($netid, $password);
    my $response = $ua->request($req);

    if ($response->is_success) {
        return $HTML = $response->content;
    } else {
        die "Failed to scrape HTML from NYUROAM page." . $response->status_line;
    }
}

=begin comment
Test if returned HTML length is greater than zero (0).
=end comment
=cut

eval {
    my $actual_html = scrape_HTML();
    ok(length($actual_html) > 0, "Scraped HTML is non-empty");
};

if ($@) {
    ok(0, "Test failed: $@");
}
