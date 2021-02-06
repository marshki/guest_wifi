#!/usr/bin/perl

=head1 NAME

get_guest_wifi.pl

=head1 DESCRIPTION

Retrieve weekly "nyuguest" credentials, then generate HTML file with the same.

=cut

#use 5.22.1;
#use strict;
#use warnings;

chop ($today = `date`);

$url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

print "$today\n$url\n";
