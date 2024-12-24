#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

=pod
=head1 DESCRIPTION

Extract weekly "nyuguest" WiFi credentials.

=head2 NAME

guest_wifi.pl v.0

=head2 SYNOPSIS
Extract weekly "nyuguest" WiFi credentials using Perl.
Requires access to NYU-NET--campus wide-area network (WAN)--and a valid NetID.
Credentials are valid for one(1) week from 12:00:00 EST Monday.

=head2 SAMPLE OUTPUT

Current time: Sun 09 Jan 2022 04:59:55 PM EST
Enter your NetID: lilcuckoo0211 
Enter your password:
Checking URL status code...
URL accessible. Continuing...
Retrieving HTML from NYUROAM page... 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4173    0  4173    0     0  17909      0 --:--:-- --:--:-- --:--:-- 17987
Parsing region of interest (ROI) from HTML...
Guest username: guest160
Guest password: giddilot

#### AUTHOR

=head2 AUTHOR

<M. Krinitz> <mjk235 [at] nyu [dot] edu>

=head2 LICENSE

Copyright <2021> <M. Krinitz>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=cut

our $date_today = localtime();

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $netid;
my $password;

my @HTML;

our $parse_HTML;
our $guest_username;
our $guest_password;

# NetID prompt.

sub netid_prompt {

  while (1) {
    print "Enter your NetID: ";

    chomp($netid = <STDIN>);
              
    last if $netid ne '';
    print "No input detected!\n";
 
  }
  return $netid;
}

# Pasword prompt (UNIX only!).

sub password_prompt {

  while (1) {
    print "Enter your password: \n";

    system ("stty -echo");
    chomp ($password = <STDIN>);
    system ("stty echo");

    last if $password ne '';
    print "No input detected!\n";

  }
  return $password;
}

# Check HTTP response code.

sub url_check {

  print "Checking URL status code...\n";

  my $status_code =
(`curl --max-time 2.5 --user ${netid}:${password} --output /dev/null --silent --head --write-out '%{http_code}\n' $url`);

  if ($status_code != '200'){
    {
      print "URL not accessible. Exiting. \n";
      exit $status_code;
    }
  } else {
      print "URL accessible. Continuing... \n";
    }
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

  print "Current time: $date_today\n";

  netid_prompt();
  password_prompt();
  url_check();
  scrape_HTML();
  parse_table();
  parse_username();
  parse_password();
 
  print "Guest username: $guest_username \n";
  print "Guest password: $guest_password \n";

}

&main();
