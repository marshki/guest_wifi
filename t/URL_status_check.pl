#!/usr/bin/perl

# Off LAN: 599
# On LAN, avec credentials:
# On LAN, sans credentials: 401

# Tiny doc: https://metacpan.org/pod/HTTP%3a%3aTiny

use strict;
use warnings;
use diagnostics;

use feature 'say';

use HTTP::Tiny;

my $Client = HTTP::Tiny->new();

my @urls = (
    'https://www.google.com',
    'http://nosuchsiteexists.com',
    'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl',
);

for my $url (@urls) {
    my $response = $Client->get($url);
    say $url, ": ", $response->{status};
}


# TODO: 
# * pass creds to POST request
# * get good response code
# * if then for 200 status

#sub URL_status_check {
#  if(expression) {
#    print "In reach!\n";
#} else {
#  print "Out of reach!\n";
#}

#URL_status_check();
