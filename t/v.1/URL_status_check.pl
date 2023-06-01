#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use LWP::Simple qw($ua get);
$ua->timeout(5);

our $url="https://nyuroam-guest.nyu.edu";

=begin URL_status_check
Die (quit) if URL is not reachable.
Max wait for resply is five (5) seconds.
=cut

sub URL_status_check {
  disable diagnostics;
  my $html = get $url || die "Request timed out. Are you connected to NYU-NET? Exiting.\n";
}

URL_status_check
