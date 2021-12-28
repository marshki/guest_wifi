#!/usr/bin perl -w

use strict;
use warnings;
use HTML::TableExtract;

my $headers = ['Guest ID', 'Password'];

my $table_extract = HTML::TableExtract->new(headers => $headers);

$table_extract->parse_file('sample.html');
my ($table) = $table_extract->tables;

for my $row ($table->rows) {
    print join(",", @$row), "\n";
}
