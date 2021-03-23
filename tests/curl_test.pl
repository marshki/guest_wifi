#!/usr/bin/perl
use strict; 
use warnings;

my $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $passy = '';
my $retrieve; 
my $parser; 

# my $retrieve = `curl -u "${netid}:${passy}" "$url"`;
my $retrieve = `curl -u "${netid}:${passy}" "$url"`;
print "$retrieve";


my $parser = sed -n '/<td>/,/<\/td>/p' $parser;
print "$parser";
