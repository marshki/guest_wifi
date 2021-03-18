#!/usr/bin/perl
use strict; 
use warnings;

my $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
my $netid = ;
my $passwd = ;

my $retrieve = `curl --user "{$netid}:{$passwd}" "$url"`;

print "$retrieve";


