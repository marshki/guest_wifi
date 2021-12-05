#!/usr/bin/perl -w

use LWP::UserAgent;
 
my $ua = LWP::UserAgent->new;
$ua->credentials('', '');
$ua->timeout(10);
 
my $response = $ua->get('https://nyuroam-guest.nyu.edu/cgi-bin/index.pl/');
 
if ($response->is_success) {
  print $response->content;
}
else {
  die $response->status_line;
};
