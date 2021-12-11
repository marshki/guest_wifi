#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

use LWP::UserAgent;
use Mozilla::CA;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

=begin URL_status_check
Check HTTP response code.
=cut
     
my $ua = LWP::UserAgent->new();
$ua->timeout(10);

my $req = new HTTP::Request(GET => $url);

$req->authorization_basic($netid, $password);
my $response = $ua->request($req);


if ($response->is_success) {
  #print "I see you fam.\n";
  print $response->content; 
  #print $response->status_line;
}
else {
  die $response->status_line;
};

# This test works on the LAN, but not off it. For example:
# Uncaught exception from user code:
# 500 Can't connect to nyuroam-guest.nyu.edu:443 (Connection timed out) at URL_status_check.pl 

#URL_status_check();
