#!/usr/bin/perl
use strict; 
use warnings;

my $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $passy = "\";

my $retrieve = `curl -u "${netid}:${passy}" "$url"`;

print "$retrieve";
