#!/usr/bin/perl

use warnings;
use LWP::Simple;

my $cont = get('https://geekberg.info') or die 'Unable to get page';

say $cont;
