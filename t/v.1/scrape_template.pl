#!/usr/bin/env perl -w 

=begin comments
Template for web scraping using LWP::UserAgent
For reference: https://metacpan.org/pod/LWP::UserAgent
Some environments require Mozilla's CA cert bundle 
For reference:
https://metacpan.org/pod/Mozilla::CA
=cut

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use Mozilla::CA; 

our $url = "";

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
$req->authorization_basic($netid, $password);
my $response = $ua->request($req)->content();
