#!/usr/bin/perl
use warnings;

=pod

=head1 NAME

get_guest_wifi.pl

=head1 SYNOPSIS

=head1 DESCRIPTION

Extract "nyuguest" WiFi credentials, then output to HTML file.

=head1 LICENSE

Copyright <2021> <M. Krinitz>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=head1 AUTHOR
<M. Krinitz> <mjk235 [at] nyu [dot] edu>

=cut

# Today's date.
chomp ($date_today = `date`);
print ($date_today . "\n");

# URL of interest.
$url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";
print ($url . "\n");

# Prompt for NetID.
print "Enter you NetID: ";
$netid = <STDIN>;
chomp ($netid); 
print ($netid . "\n");

# Pasword prompt.

print "Enter The Password : ";  
system ("stty -echo");  
$passy = <STDIN>;  
system ("stty echo");

chomp ($passy);
print ($passy . "\n");


