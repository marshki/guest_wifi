#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

use LWP::Simple;

our $url="https://nyuroam-guest.nyu.edu";

### TODO: 
# https://metacpan.org/pod/LWP::Simple
# Set timeout variable
# Let user know about the wait time

timeout(7);

=begin URL_status_check
Exit if URL's response header is not available.
=cut

sub URL_status_check {

  if (! head($url)) {
    die "$url NOT reachable!!!"; 
  }
}

URL_status_check;

#if (! head($url)) {
#  die "$url NOT reachable!!!" 
#}
