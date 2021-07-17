#!/usr/bin/perl

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

#sub URL_status_check {
#  if(expression) {
#    print "In reach!\n";
#} else {
#  print "Out of reach!\n";
#}

#URL_status_check();
