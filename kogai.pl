#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use bytes (); # () をお忘れなく

my $string = "dankogai小飼弾";
binmode STDOUT, ':utf8'; # STDOUTはUTF-8ストリーム
printf "length('%s') == %d\n", $string, length($string);
printf "bytes::length('%s') == %d\n", $string, bytes::length($string);
