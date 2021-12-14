#!/usr/bin/perl -w 

use strict;
use warnings; 
use diagnostics;

use Term::ReadKey;

=begin password_prompt 
Prompt user for input. Null string is not valid.
Returns: string
=cut

sub silent_prompt {

  print "Enter your password: \n";

  # Do not show typed chars
  Term::ReadKey::ReadMode('noecho');

  my $password = Term::ReadKey::ReadLine(0);

  # Reset the terminal
  Term::ReadKey::ReadMode('restore');

  # Get rid of line ending (works on Windows, too!)
  $password =~ s/\R\z//;

  return $password;
}

silent_prompt;
