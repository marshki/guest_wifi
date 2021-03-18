#!/usr/bin/perl
use strict; 
use warnings;
 
our $date_today = `date`;

my $netid;
my $passwd; 

sub netid_prompt {
  print "Enter you NetID: ";

  chomp ($netid = <STDIN>);
  return $netid;
}

sub passwd_prompt { 

  print "Enter your password: ";

  system ("stty -echo");
  chomp ($passwd = <STDIN>);
  system ("stty echo" );
  print "\n";

  return $passwd;
} 

sub main { 
  
  print ($date_today = `date`);

  netid_prompt();
  passwd_prompt();

  print "Your NetID is: $netid and your password is: $passwd \n"

} 

&main();
