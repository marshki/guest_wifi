#!/usr/bin/perl

use warnings;
use diagnostics;

use Test::Simple tests => 1;

my $credentials = 'derp!eY  D00ooEw';

=begin scrape_HTML
Formatted print statement.
=cut

sub print_credentials {
  print 'Guest ID',' ','Password', "\n";
  print '--------',' ','--------', "\n";
  print $credentials, "\n";
}

ok( $credentials eq $credentials);
