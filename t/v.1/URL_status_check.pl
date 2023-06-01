#!/usr/bin/perl

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::Simple qw($ua get);
$ua->timeout(5);

our $url="https://nyuroam-guest.nyu.edu";

=begin URL_status_check
Max time to wait for server response is five (5) seconds.
Die (quit) if URL is not reachable.
=cut

sub URL_status_check {
  disable diagnostics;
  my $html = get $url || die "Request timed out. Are you connected to NYU-NET? Exiting.\n";
}

URL_status_check
