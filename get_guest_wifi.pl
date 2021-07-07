#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

=pod
=head1 NAME
get_guest_wifi.pl
=head1 SYNOPSIS
=head1 DESCRIPTION
Extract weekly "nyuguest" WiFi credentials in Perl.
=head1 LICENSE
Copyright <2021> <M. Krinitz>
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=head1 AUTHOR
<M. Krinitz> <mjk235 [at] nyu [dot] edu>
=cut

our $date_today = `date`;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid;
my $password;
my @HTML;
our $parse_HTML;
our $guest_username;
our $guest_password;

# NetID prompt.

sub netid_prompt {
  print "Enter you NetID then press [Enter]: \n";

  chomp ($netid = <STDIN>);

  return $netid;

}

# Pasword prompt (UNIX only!).

sub password_prompt {
  print "Enter your password then press [Enter]: \n";

  system ("stty -echo");
  chomp ($password = <STDIN>);
  system ("stty echo");

  return $password;

}

# Pass credentials to curl, and assign page to "@HTML".

sub scrape_HTML {
  print "Retrieving HTML from NYUROAM page... \n";

  return @HTML = (`curl --user '$netid':'$password' '$url'`);

}

# Extract region of interest (ROI) from "@HTML".

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  return $parse_HTML = (grep { /table.*Guest.*Password/ } @HTML)[0];

}

# Parse guest username, password from: "$parse_HTML".

sub parse_username {
  $guest_username = (split qr{</?td>}, $parse_HTML)[6];

}

sub parse_password {
  $guest_password = (split qr{</?pre>}, $parse_HTML)[1];

}

# Wrapper.

sub main() {

  print "$date_today";

  netid_prompt();
  password_prompt();
  scrape_HTML();
  parse_table();
  parse_username();
  parse_password();
 
  print "Guest username: $guest_username \n";
  print "Guest password: $guest_password \n";

}

&main();
