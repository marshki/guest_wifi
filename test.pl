#!/usr/bin/perl
use strict;
use warnings;

our $date_today = `date`;
print ($date_today = `date`);


sub netid_prompt{
  print "Enter you NetID: ";

  chomp (my $netid = <STDIN>);

  return $netid;
}

sub passwd_prompt{ 

  print "Enter your password: ";

  system ("stty -echo");
  chomp (my $passwd = <STDIN>);
  system ("stty echo");

  return $passwd;
} 

sub main{
  netid_prompt();
  passwd_prompt();
}


&main();

