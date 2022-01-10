#!/usr/bin/perl

use warnings;
use diagnostics;

=begin scrape_HTML
Formatted print statement.
=cut

sub print_credentials {
  print 'Guest ID',' ','Password', "\n";
  print '--------',' ','--------', "\n";
  print $credentials, "\n";
}
