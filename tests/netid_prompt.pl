#!/usr/bin/perl
use strict; 
use warnings;
 
my $netid;

sub netid_prompt {
  print "Enter you NetID: ";

  chomp ($netid = <STDIN>);
  return $netid;
}

netid_prompt();
print "Your NetID is: $netid \n";
