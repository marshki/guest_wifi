#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my $HTML='
       <table>
        <td><table border="1" cellspacing="0" cellpadding="5"><tr bgcolor="#AAAAAA" align="center" valign="center"><td><b>Guest ID</b></td> <td><b>Password</b></td></tr><tr bgcolor="#FFFFFF" align="center" valign="center"><td>guest160</td> <td><pre>plangogu</pre></td></tr></table>
                 </td>
                 </tr>
                 </table>
';
 
my $HTML_table;

=begin parse_HTML
Extract region of interest (table) from HTML.
=cut

sub parse_table {
  print "Parsing HTML from NYUROAM page... \n";

  @HTML_table = (grep { /table.*Guest.*Password/ } @HTML)[0];

  print "@HTML_table"; 
}

parse_table();
