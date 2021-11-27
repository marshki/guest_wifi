use v5.30; 

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request::Common;
     
     
my $ua = LWP::UserAgent->new();
my $request = GET 'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl';
     
$request->authorization_basic('', '');
     
my $response = $ua->request($request);
say $response->as_string();
