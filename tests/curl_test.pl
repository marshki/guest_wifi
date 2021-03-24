#!/usr/bin/perl
use strict; 
use warnings;

my $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = "";
my $passy = '';
my $retrieve; 


# Pass creds to curl and extract ROI with "sed": 
my $retrieve = `curl -u "${netid}:${passy}" "$url" |sed -n '/<td>/,/<\/td>/p'`;
print "$retrieve";

# Pass creds to curl and get page: 
# my $retrieve = `curl -u "${netid}:${passy}" "$url"`;
# print "$retrieve";

# Pass creds to curl and extract ROI with "grep":
# my $retrieve = `curl -u "${netid}:${passy}" "$url" |grep table| grep Guest| grep Password`;
# print "$retrieve";

