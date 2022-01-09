#!/usr/bin/perl -w

use v5.30;

use strict;
use warnings;
use diagnostics;

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

sub main() {
  netid_prompt();
  password_prompt();
  scrape_HTML();
  parse_table();
  print_credentials();
}

&main();
