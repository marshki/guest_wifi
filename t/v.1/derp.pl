#!/usr/bin/perl -w

use diagnostics;
use strict;
use warnings;
use HTML::Parser ();
 
# Create parser object
my $p = HTML::Parser->new(
  api_version => 3,
  start_h => [\&start, "tagname, attr"],
  end_h   => [\&end,   "tagname"],
  marked_sections => 1,
);
 
# Parse document text chunk by chunk
$p->parse($chunk1);
$p->parse($chunk2);
# ...
# signal end of document
$p->eof;
 
# Parse directly from file
#$p->parse_file("sample.html");
# or
open(my $fh, "<:utf8", "sample.html") || die;
$p->parse_file($fh);
