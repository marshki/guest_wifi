#!/usr/bin/perl
use strict; 
use warnings;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $passy = "\";

# Pass creds to curl and extract ROI via regex parse: 

# Grep works, but can be more precise: 

my $retrieve = `curl --user "${netid}:${passy}" "$url" > output.txt

# |grep table |grep Guest |grep Password`;

# Awk works: 
# These work on a file, but not, for some reason, when using a pipe: 

# my $retrieve = `curl --user "${netid}:${passy}" "$url" |awk '\<td>\{a=$0}END{print a}'`;

print "$retrieve";

# my $parser = `sed -n '/<td>/,/\</td>/p' "$retrieve"`;
# my $parser = (`awk '\<td>\{a=$0}END{print a}' "$retrieve"`);
