#!/usr/bin/env perl -w 

# Template for web scraping using LWP::UserAgent
# For reference: 
# https://metacpan.org/pod/LWP::UserAgent
# Needed in some environments for SSL certs:
# https://metacpan.org/pod/Mozilla::CA

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use Mozilla::CA; 

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
$req->authorization_basic($netid, $password);
my $response = $ua->request($req);

say $response->as_string();
