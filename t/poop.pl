#!/usr/bin/env perl -w 

package MyAgent;

use base 'LWP::UserAgent';

sub get_basic_credentials {
    return '', '';
}

package main;

my $agent = MyAgent->new;


my $response = $agent->get( 'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl' );


# my $agent = MyAgent->new;

# my $response = $agent->get( 'https://nyuroam-guest.nyu.edu/cgi-bin/index.pl' );
print $response->as_string();
