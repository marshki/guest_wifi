#!/usr/bin/perl
use strict; 
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "" ;
my $passy = "\" ;

# Pass credentials to curl, assigning HTML to variable.  

my @retrieve_HTML = (`curl --user "${netid}:${passy}" "$url"`) ;

# Extract region of interest (ROI) from HTML.

my $parse_HTML = (grep { /table.*Guest.*Password/ } "@retrieve_HTML")[0] ;

# Extract username from ROI.

my $guest_username = (split qr{</?td>}, "$parse_HTML")[6];
print "$guest_username" ; 

# Extract password from ROI.

my $guest_password = (split qr{</?pre>}, "$parse_HTML")[1];
print "$guest_password" ; 
