#!/usr/bin/perl -w
use strict;
use warnings;
use utf8;
use bytes();
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

my $msg;
$msg = '現在、危険情報は出ておりませんが、';
my $content = "";
if ($content =~ /現在、危険情報は出ておりませんが、/) {
  prnt "ERR\n";
}
