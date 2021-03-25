#!/usr/bin/perl
use strict; 
use warnings;

my $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $passy = '';
my $retrieve; 
my $parser;

# Pass creds to curl and extract ROI with "sed": 
my $retrieve = `curl -u "${netid}:${passy}" "$url"`;
print "$retrieve";

my $parser = (`awk '/<td>/{a=$0}END{print a}' "$retrieve"`);

print "$parser";

# This works: 
# Pass creds to curl and get page: 
# my $retrieve = `curl -u "${netid}:${passy}" "$url"`;
# print "$retrieve";

#my $parser = `sed -n '/<td>/,/\</td>/p' "$retrieve"`;

# This works:
# Pass creds to curl and extract ROI with "grep":
# my $retrieve = `curl -u "${netid}:${passy}" "$url" |grep table| grep Guest| grep Password`;
# print "$retrieve";

