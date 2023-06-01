#!/usr/bin/perl

use strict;
use warnings;

use Test::Simple tests => 1;

my $credentials = 'derp!eY  D00ooEw';

=begin comment
Formatted print statement.
=end comment
=cut

sub print_credentials {

  my $credentials = shift;
  print 'Guest ID',' ','Password', "\n";
  print '--------',' ','--------', "\n";
  print $credentials, "\n";
}

ok( $credentials eq $credentials);
