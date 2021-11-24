#!/usr/bin/perl

use LWP::UserAgent;
...
my $ua = LWP::UserAgent->new;

$ua->credentials($id, $password);

my $response = $ua->get();
my $response = $ua->get($url);

die "Retrieving '$url' failed: ${\($response->status_line)}\n" 
  unless $response->is_success;

my @html_lines = split /\n/, $response->content;
