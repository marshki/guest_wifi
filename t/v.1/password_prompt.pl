#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use Test::Simple tests => 1;

use Term::ReadKey;

my $password;

=begin comment
Prompt user for input. Null string is not valid.
Input obfuscated by Term::ReadKey package.
Returns: string
=end comment
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
