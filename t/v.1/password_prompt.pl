#!/usr/bin/perl -w 

use v5.30;

use strict;
use warnings; 
use diagnostics;

use Test::Simple tests => 1;

use Term::ReadKey;

my $password;

=begin password_prompt 
Prompt user for input. Null string is not valid.
Returns: string
=cut

sub password_prompt {

while (1) {
  print "Enter your password: \n";

  Term::ReadKey::ReadMode('noecho');
  chomp ($password = Term::ReadKey::ReadLine(0));
  Term::ReadKey::ReadMode('restore');
  
  last if $password ne '';
    print "No input detected!\n";

  }
  return $password;
}

password_prompt;

ok( $password eq $password );
