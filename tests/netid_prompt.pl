#!/usr/bin/perl -w
use strict; 
use warnings;

my $netid;
my $test_0; 
my $test_1;
my $derp = "derp!";

sub netid_prompt {
  print "Enter you NetID: ";

  chomp ($netid = <STDIN>);
  return $netid;
}

sub test_0 {
  $test_0 = $netid eq $netid; 
  print "Comparing: $netid to: $netid \n";

  if ($test_0 == 1) {  
    print "True\n";
  }
  else {
    print "False\n";
 }
}
sub test_1 {
  $test_1 = $netid eq $derp; 
  print "Comparing: $netid to: $derp \n";

  if ($test_1 == 1) {  
    print "True\n";
  }
  else {
    print "False\n";
 }
}

netid_prompt();
test_0();
test_1();
