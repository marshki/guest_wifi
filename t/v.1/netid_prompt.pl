#!/usr/bin/perl -w
use strict;
use warnings;
use diagnostics;

use Test::Simple tests => 1;

my $netid;

=begin netid_prompt
Prompt user for input. Null string is not valid.
Returns: string
=cut

sub netid_prompt {

  while (1) {
    print "Enter your NetID: ";

    chomp($netid = <STDIN>);
              
    last if $netid ne '';
    print "No input detected!\n";
    
  }
  return $netid;
}

netid_prompt;

ok( $netid eq $netid );
