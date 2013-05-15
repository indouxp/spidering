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
my $msg = 'を読み込めませんでした。';

my $content = get($url);
die "$url$msg" unless defined $content;

$content = decode('shiftjis', $content);
$content =~ s/<<!--(.*?)-->//gs;
$content =~ / SELECTED>▼([^<]+)</;
print "$1\n";
if ($content =~ /現在、危険情報は出ておりませんが、/) {
  print "  危険情報は出ていません。\n";
} else {
  print "  危険情報が出ています。\n";
}
print "  詳細はhttp://www.anzen.mofa.go.jp/を見てください。\n";
