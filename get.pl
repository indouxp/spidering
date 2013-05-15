#!/usr/bin/perl -w
use strict;
use warnings;
use utf8;
use bytes();
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

use LWP::Simple;
use Encode;

my $id = shift @ARGV|| '074';

my $url = "http://www.anzen.mofa.go.jp/info/info4.asp?id=$id";
my $msg = '$B$rFI$_9~$a$^$;$s$G$7$?!#(B';

my $content = get($url);
die "$url$msg" unless defined $content;

$content = decode('shiftjis', $content);
$content =~ s/<<!--(.*?)-->//gs;
$content =~ / SELECTED>$B"'(B([^<]+)</;
print "$1\n";
if ($content =~ /$B8=:_!"4m81>pJs$O=P$F$*$j$^$;$s$,!"(B/) {
  print "  $B4m81>pJs$O=P$F$$$^$;$s!#(B\n";
} else {
  print "  $B4m81>pJs$,=P$F$$$^$9!#(B\n";
}
print "  $B>\:Y$O(Bhttp://www.anzen.mofa.go.jp/$B$r8+$F$/$@$5$$!#(B\n";
