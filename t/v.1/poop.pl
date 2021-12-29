#!/usr/bin perl -w

# For reference: https://metacpan.org/pod/HTML::TableExtract

use strict;
use warnings;
use diagnostics;

use HTML::TableExtract;

my $headers = ['Guest ID', 'Password'];

my $table_extract = HTML::TableExtract->new(headers => $headers);

$table_extract->parse_file('sample.html');
my ($table) = $table_extract->tables;


for my $row ($table->rows) {
    print 'Guest ID',' ','Password', "\n";
    print '--------',' ','--------', "\n";
    print join(" ", @$row), "\n";
}
