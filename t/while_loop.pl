#!/usr/bin/perl -w

use strict;
use warnings;

my $netid;

=begin netid_prompt
Returns: NetID credential.
Prompt user for input.
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
