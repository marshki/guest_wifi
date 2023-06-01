#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use Test::Simple tests => 1;

my $netid;

=begin comment
Prompt user for input. Null string not valid.
Returns: string
=end comment
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
