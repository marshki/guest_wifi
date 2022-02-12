#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

#use LWP::UserAgent;
#use Mozilla::CA;

use LWP::Simple;

my $url="https://nyuroam-guest.nyu.edu";
if (! head($url)) {
  die "The Server is DOWN!!!!" 
}
