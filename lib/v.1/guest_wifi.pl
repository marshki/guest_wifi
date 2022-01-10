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

Sample output:

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

our $date_today = `date`;

use Term::ReadKey;
use LWP::UserAgent;
use Mozilla::CA;
use HTML::TableExtract;

my $netid;
my $password;

our $url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";

my $ua = LWP::UserAgent->new();
my $req = new HTTP::Request(GET => $url);

my @HTML;
our $HTML;

my $headers = ['Guest ID', 'Password'];
my $table_extract = HTML::TableExtract->new(headers => $headers);

our $credentials;

# netid_prompt

sub netid_prompt {

  while (1) {
    print "Enter your NetID: ";

    chomp($netid = <STDIN>);
              
    last if $netid ne '';
    print "No input detected!\n";
  }
  return $netid;
}

# password_prompt 

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

# scrape_HTML

sub scrape_HTML {
  print "Scraping HTML from NYUROAM page... \n";

  $req->authorization_basic($netid, $password);

  return $HTML = $ua->request($req)->content();
}

# parse_table

sub parse_table {
  print "Parsing region of interest (ROI) from HTML... \n";

  $table_extract->parse($HTML);
  my ($table) = $table_extract->tables;

  for my $row ($table->rows) {
    return our $credentials = join(" ", @$row);
  } 
}

# print_credentials

sub print_credentials {
  print 'Guest ID',' ','Password', "\n";
  print '--------',' ','--------', "\n";
  print $credentials, "\n";
}

# main

sub main() {
  print "Current time: $date_today";
      
  netid_prompt();
  password_prompt();
  scrape_HTML();
  parse_table();
  print_credentials();
}

&main();
