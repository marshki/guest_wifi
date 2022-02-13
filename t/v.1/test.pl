# Note that if you do this, you must explicitly
# export everything you want to use:
use LWP::Simple qw($ua get);

our $url="https://nyuroam-guest.nyu.edu";

$ua->timeout(5);	

my $html = get $url || die "Request timed out!\n";
