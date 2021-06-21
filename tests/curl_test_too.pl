#!/usr/bin/perl
use strict; 
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "" ;
my $passy = "\" ;

my $retrieve_HTML = (`curl --user "${netid}:${passy}" "$url"`) ;
my $parse_HTML = (grep { /table.*Guest.*Password/ } $retrieve_HTML)[0] ;

my $guest_username = (split qr{</?td>}, $parse_HTML)[6];

print "$guest_username" ; 

my $guest_password = (split qr{</?pre>}, $parse_HTML)[1];
print "$guest_password" ; 

