#!/usr/bin/perl
use strict; 
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl" ;

my $netid = "\" ;
my $passy = "\" ;

# Pass credentials to curl, then retireve ROI.
# Grep table: 

my $retrieve_table = `curl --user "${netid}:${passy}" "$url" |grep table |grep Guest| grep Password` ;
print "$retrieve_table" ;

#my $retrieve_table = `curl --user "${netid}:${passy}" "$url"` ;
#print "$retrieve_table" ;

my $awk_parser = `awk -F '</*pre>' '$2{print $2}' `; #"$retrieve_table"` ;

my $parse_username = `"$awk_parser" "retrieve_table"` ; 

print "$parse_username" ; 

#my $parse_username = `awk -F '</*pre>' '$2{print $2}' "$retrieve_table"` ; 

#print "$parse_username" ; 

# awk -F '</*pre>' '$2{print $2}' parseMe

# awk -F '</*td>' '$2{print $7}' index.pl

################################################################################
# Pass credentials to curl, then retireve ROI.
