use LWP::Simple;
my $url="http://cpan.org";
if (! head($url)) {
  die "The Server is DOWN!!!!" 
}
