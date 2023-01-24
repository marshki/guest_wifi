#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

=begin url_check
Exit if HTTP response code not 200.
NOTE: Escape (backslash) speacial characters in input when using curl, e.g.: '\@'.
=cut

sub url_check {

  print "Checking URL status code...\n";

  my $status_code =
(`curl --max-time 2.5 --user ${netid}:${password} --output /dev/null --silent --head --write-out '%{http_code}\n' $url`);

  if ($status_code != '200'){
    {
      print "URL not accessible. Exiting. \n";
      exit;
    }
  } else {
      print "URL accessible. Continuing... \n";
    }
}

url_check
