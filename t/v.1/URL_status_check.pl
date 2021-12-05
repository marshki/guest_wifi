#!/usr/bin/perl -w

# Off LAN: 599
# On LAN, avec credentials:
# On LAN, sans credentials: 401

use strict;
use warnings;
use diagnostics;


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

#URL_status_check();
