use LWP::Simple;
my $url="http://derp.com";
if (! head($url)) {
  die "The Server is DOWN!!!!" 
}
