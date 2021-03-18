#!/usr/bin/perl
use strict; 
use warnings;
 
our $date_today = `date`;
print ($date_today = `date`);

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

  return $passwd;
} 

sub main { 

  netid_prompt();
  passwd_prompt();

} 

&main();
