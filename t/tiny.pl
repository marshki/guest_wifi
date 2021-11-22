#!/usr/bin/perl


use HTTP::Tiny;

my $http = HTTP::Tiny->new(verify_SSL => 1, timeout => 5);
my $resp = $http->get("https://nyuroam-guest.nyu.edu/cgi-bin/index.pl");
my $body = $resp->{content};

print $body;
