#!/usr/bin/perl -w

#use strict;
use warnings;
use v5.10;
use LWP::UserAgent;
use HTTP::Request::Common;
use Mozilla::CA module;
     
my $ua = LWP::UserAgent->new();
my $request = GET 'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl';
     
$request->authorization_basic('netID', 'password');
     
my $response = $ua->request($request);
say $response->as_string();
