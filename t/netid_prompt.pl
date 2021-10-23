#!/usr/bin/perl -w
use strict; 
use warnings;

my $netid;
my $test_0; 
my $test_1;
my $false_flag = "false_flag!";

=begin netid_prompt
Prompt user for NetID.
TODO:Add exception handling.
=cut

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
  $test_1 = $netid eq $false_flag; 
  print "Comparing: $netid to: $false_flag \n";

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
