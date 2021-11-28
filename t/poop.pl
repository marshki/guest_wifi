#!/usr/bin/env perl -w 

use v5.30;

use strict;
use warnings;
use diagnostics;

package MyAgent;

use base 'LWP::UserAgent';

sub credentials {
    return '', '';
}

package main;

my $agent = MyAgent->new;

my $response = $agent->get('https://nyuroam-guest.nyu.edu/cgi-bin/index.pl');

print $response->as_string();
