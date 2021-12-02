#!/usr/bin/perl -w
use strict;
use warnings;
use diagnostics;

use Test::Simple tests => 1;

my $password;

=begin password_prompt 
(UNIX only!)
Prompt user for input. Null string is not valid.
Returns: string
=cut

sub password_prompt { 

  while (1) {
    print "Enter your password: \n";

    system ("stty -echo");
    chomp ($password = <STDIN>);
    system ("stty echo");

    last if $password ne '';
    print "No input detected!\n";

  } 
  return $password;
}

password_prompt();

ok( $password eq $password );
