#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use LWP::Simple qw($ua get);
$ua->timeout(5);

our $url="https://nyuroam-guest.nyu.edu";

=begin comment
Die (quit) if URL is not reachable.
Max wait for reply is five (5) seconds.
=end comment
=cut

sub URL_status_check {
  my $html = get $url || die "Request timed out. Are you connected to NYU-NET? Exiting.\n";
}

URL_status_check
