#!/usr/bin/perl

use v5.30;

use warnings;
use diagnostics;

=pod
=head1 DESCRIPTION

Extract weekly "nyuguest" WiFi credentials.

=head2 NAME

guest_wifi.pl v.1

=head2 SYNOPSIS

Extract weekly "nyuguest" WiFi credentials using Perl.
Requires access to NYU-NET--campus wide-area network (WAN)--and a valid NetID.
Credentials are valid for one(1) week from 12:00:01 EST Monday.

=head2 SAMPLE OUTPUT

Current time: Sun 09 Jan 2022 04:39:20 PM EST
Enter your NetID: lilcuckoo0211
Enter your password:
Scraping HTML from NYUROAM page...
Parsing region of interest (ROI) from HTML...
Guest ID Password
-------- --------
guest160 giddilot

#### AUTHOR

=head2 AUTHOR

<M. Krinitz> <mjk235 [at] nyu [dot] edu>

=head2 LICENSE

Copyright <2022> <M. Krinitz>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=cut

use LWP::Simple qw($ua get);
$ua->timeout(5);

use Term::ReadKey;
use LWP::UserAgent;
use Mozilla::CA;
use HTML::TableExtract;

our $current_time = localtime();

our $url_0 = "https://nyuroam-guest.nyu.edu";

my $netid;
my $password;

# URL_status_check

sub URL_status_check {
  disable diagnostics;
  my $html = get $url_0 || die "Request timed out. Are you connected to NYU-NET? Exiting.\n";
}

# NetID prompt

sub netid_prompt {

  while (1) {
    print "Enter your NetID: ";

    chomp ($netid = <STDIN>);
              
    last if $netid ne '';
    print "No input detected!\n";
    
  }
  return $netid;
}

# Password prompt

sub password_prompt {

while (1) {
  print "Enter your password: \n";

  Term::ReadKey::ReadMode('noecho');
  chomp ($password = Term::ReadKey::ReadLine(0));
  Term::ReadKey::ReadMode('restore');

  last if $password ne '';
    print "No input detected!\n";

  }
  return $password;
}

# Main

sub main() {
  print "Timestamp: $current_time\n";

  URL_status_check();
  netid_prompt();
  password_prompt();
}

&main();
