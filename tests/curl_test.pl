#!/usr/bin/perl
use strict; 
use warnings;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "\";
my $passy = "\";

# Pass credentials to curl, then retireve ROI.
# Grep table: 

# my $retrieve_table = `curl --user "${netid}:${passy}" "$url" |grep table |grep Guest| grep Password` ;
# print "$retrieve_table" ;

my $parse_username = `curl --user "${netid}:${passy}" "$url" 2>/dev/null | awk -F '</*pre>' '$2{print $2}'` ;

print "$parse_username" ; 

#print "$retrieve_table" ;

# my $parse_username = `awk -F '</*pre>' '$2{print $2}' "$retrieve_table"` ; 

#print "$parse_username" ; 

# awk -F '</*pre>' '$2{print $2}' parseMe

# awk -F '</*td>' '$2{print $7}' index.pl


################################################################################
# Pass credentials to curl, then retireve ROI.
