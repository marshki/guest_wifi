#!/usr/bin/perl

# https://metacpan.org/pod/LWP::Simple

use v5.30;

use warnings;
use diagnostics;

use LWP::Simple;

our $url="https://nyuroam-guest.nyu.edu";

=begin URL_status_check
Exit if URL's response header is not available.
=cut

sub URL_status_check {

  if (! head($url)) {
    die "$url NOT reachable!!!"; 
  }
}

URL_status_check;
