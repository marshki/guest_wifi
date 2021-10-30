#!/usr/bin/perl -w
use strict; 
use warnings;

use Test::Simple tests => 1;

my $netid;
my $test_netid="mjk235";

=begin netid_prompt
Prompt user for NetID.
TODO:Add exception handling.
=cut

sub netid_prompt {
  print "Enter you NetID: ";

  chomp ($netid = <STDIN>);
  return $netid;
}

netid_prompt();

ok( $netid eq $test_netid ); 
