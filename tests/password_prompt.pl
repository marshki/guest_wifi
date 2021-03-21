#!/usr/bin/perl -w
use strict; 
use warnings;

my $password;
my $test_0; 
my $test_1;
my $derp = "derp!";

sub password_prompt { 
  print "Enter your password: \n";

  system ("stty -echo");
  chomp ($password = <STDIN>);
  system ("stty echo");
 
  return $password;
}

sub test_0 {
  $test_0 = $password eq $password; 
  print "Comparing: $password to: $password \n";

  if ($test_0 == 1) {  
    print "True\n";
  }
  else {
    print "False\n";
 }
}
sub test_1 {
  $test_1 = $password eq $derp; 
  print "Comparing: $password to: $derp \n";

  if ($test_1 == 1) {  
    print "True\n";
  }
  else {
    print "False\n";
 }
}

password_prompt();
test_0();
test_1();
