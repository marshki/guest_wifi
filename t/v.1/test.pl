use LWP::Simple;

my $url="https://nyuroam-guest.nyu.edu";
if (! head($url)) {
  die "The Server is DOWN!!!!" 
}
