#!/usr/bin/perl
use strict; 
use warnings;
 
our $date_today = `date`;
print ($date_today = `date`);


sub main{ 

  sub netid_prompt{
    print "Enter you NetID: ";

    chomp (our $netid = <STDIN>);
    return $netid;
  }

  netid_prompt();
  print "Your netid is:$netid \n";
} 

&main();

=pod 

sub passwd_prompt{ 

  print "Enter your password: ";

  system ("stty -echo");
  chomp (our $passwd = <STDIN>);
  system ("stty echo" );

  return $passwd;
} 



&main();
=cut
