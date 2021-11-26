#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use HTTP::Request::Common;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
     
my $ua = LWP::UserAgent->new();
my $request = GET $url;

my $netid = "";
my $password = "\";
# my @HTML;
     
$request->authorization_basic($netid, $password);
     
my $response = $ua->request($request);
say $response->as_string();
