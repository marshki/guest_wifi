#!/usr/bin/perl
use strict;
use warnings;

my $netid;

sub main {

  sub netid_prompt {
    print "Enter you NetID: ";

    chomp ($netid = <STDIN>);
    return $netid;
  }

  netid_prompt();
  print "Your netid is: $netid \n";
}

&main();
