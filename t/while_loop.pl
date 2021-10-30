#!/usr/bin/perl -w
# https://stackoverflow.com/questions/21665179/terminating-while-loop-with-empty-stdin-in-perl

use strict;
use warnings;

my $netid;

=begin netid_prompt
Prompt user for NetID.
=cut

sub netid_prompt {

  local while (1) {
    print "Enter your NetID: ";

    chomp($netid = <STDIN>);
    return $netid;

    last if $netid ne '';
    }
}

netid_prompt;
