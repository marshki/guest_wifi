#!/usr/bin/perl -w
use strict; 
use warnings;
use Test::Simple tests => 1;

my $netid;

=begin netid_prompt
Prompt user for NetID.
TODO:Add exception handling.
=cut

sub netid_prompt {
  print "Enter you NetID: ";

  chomp ($netid = <STDIN>);
  return $netid;
}

ok( $netid is $netid ); 

netid_prompt();
