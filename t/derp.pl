#!/usr/bin/env perl -w 

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => 'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl');
$req->authorization_basic('netID','passwd');
my $response = $ua->request($req);

say $response->as_string();
