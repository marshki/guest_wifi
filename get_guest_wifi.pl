#!/usr/bin/perl

=head1 NAME

get_guest_wifi.pl

=head1 DESCRIPTION

Retrieve "nyuguest" network credentials, then generate an HTML file with the same.

=cut

#use 5.22.1;
#use strict;
#use warnings;

chop ($date_today = `date`);

$url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

$retrieve_url = `curl -u "${m}:${g}" "$url"; 

#$parse_index| grep table |grep Guest |grep Password`;

print "$date_today\n$url\n";
