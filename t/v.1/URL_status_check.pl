#!/usr/bin/perl -w

# Response codes:
# --------------
# Off LAN: 599
# On LAN, avec credentials:
# On LAN, sans credentials: 401

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

#my @urls = (
#    'https://www.google.com',
#    'http://nosuchsiteexists.com',
#    'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl',
#);

my $netid = "";
my $password = "";
     
my $ua = LWP::UserAgent->new();
$ua->timeout(10);

my $req = new HTTP::Request(GET => $url);

$req->authorization_basic($netid, $password);
my $response = $ua->request($req);

if ($response->is_success) {
  print $response->content; 
}
else {
  die $response->status_line;
};

#iterate
#for my $url (@urls) {
#    my $response = $Client->get($url);
#    say $url, ": ", $response->{status};
#}

#URL_status_check();
