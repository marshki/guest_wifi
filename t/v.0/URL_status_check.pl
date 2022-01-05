#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid = "";
my $password = "";

=begin url_check
Exit if HTTP response code not 200.
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
