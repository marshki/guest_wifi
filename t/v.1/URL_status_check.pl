#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

use LWP::Simple qw($ua get);
$ua->timeout(5);

our $url="https://nyuroam-guest.nyu.edu";

=begin URL_status_check
Die if URL is not retrievable.
=cut

my $html = get $url || die "Request timed out!\n";

