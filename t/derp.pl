#!/usr/bin/env perl -w 

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "\";
my $password = "\";

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
$req->authorization_basic($netid, $password);
my $response = $ua->request($req);

say $response->as_string();
