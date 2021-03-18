#!/usr/bin/perl
use strict;
use warnings;

my $netid;
my $passwd; 

sub main {

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


  netid_prompt();
  passwd_prompt();
  print "Your netid is: $netid and your password is: $passwd \n";
}

&main();
