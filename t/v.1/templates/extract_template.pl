#!/usr/bin/perl

use v5.30;

use strict;
use warnings;

use HTML::TableExtract;

=begin comment
Template for extracting table from HTML using HTML::TableExtract
Ref: https://metacpan.org/pod/HTML::TableExtract
=end comment
=cut

my $headers = ['Guest ID', 'Password'];

my $table_extract = HTML::TableExtract->new(headers => $headers);

$table_extract->parse_file('sample.html');
my ($table) = $table_extract->tables;

for my $row ($table->rows) {
    print 'Guest ID',' ','Password', "\n";
    print '--------',' ','--------', "\n";
    print join(" ", @$row), "\n";
}
