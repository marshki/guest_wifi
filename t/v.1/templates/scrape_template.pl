#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use LWP::UserAgent;
use Mozilla::CA; 

=begin comment
Template for web scraping using LWP::UserAgent
Ref: https://metacpan.org/pod/LWP::UserAgent
Some environments require Mozilla's CA cert bundle
Ref: https://metacpan.org/pod/Mozilla::CA
=end comment
=cut

our $url = "";

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);
$req->authorization_basic($netid, $password);
my $response = $ua->request($req)->content();
