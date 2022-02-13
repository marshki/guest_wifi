#!/usr/bin/perl

# https://metacpan.org/pod/LWP::Simple

use v5.30;

use warnings;
use diagnostics;

#use LWP::Simple ;

use LWP::Simple qw($ua get) ;
my $ua = LWP::UserAgent->new;
$ua->timeout(5);

our $url="https://nyuroam-guest.nyu.edu";

=begin URL_status_check
Exit if URL's response header is not available.
=cut

sub URL_status_check {
  
  print "This may take a while...\n";

  $ua->timeout( 1/1000000 );
  if (! head($url)) {
    die "$url NOT reachable!!!\n";
  }
}

URL_status_check;
