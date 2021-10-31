#!/usr/bin/perl -w

use strict;
use warnings;

my $netid;

=begin netid_prompt
Prompt user for NetID.
=cut

sub netid_prompt {

  while (1) {
    print "Enter your NetID: ";

    chomp($netid = <STDIN>);
              
    last if $netid ne '';
    print "Try again!\n";
    
  }
  return $netid;
}    

netid_prompt;
