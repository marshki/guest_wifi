#!/usr/bin/perl
use strict; 
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "" ;
my $passy = "\" ;

### Pass credentials to curl, then retireve ROI.
# grep table: 

my $parse_table = (`curl --user "${netid}:${passy}" "$url" |grep table |grep Guest| grep Password`) ;
print "$parse_table" ;

#my $parse_username = (`awk -F '</*pre>' '$2{print $2}' $parse_table`) ;
#print "$parse_username" ;

#$awk_parser = 
#print "$awk_parser" ;
#my $parse_username = `"$awk_parser" "retrieve_table"` ;
#print "$parse_username" ;
#my $parse_username = `awk -F '</*pre>' '$2{print $2}' "$retrieve_table"` ;
#print "$parse_username" ;
# awk -F '</*pre>' '$2{print $2}' parseMe
# awk -F '</*td>' '$2{print $7}' parseMe
################################################################################
# Pass credentials to curl, then retireve ROI.

