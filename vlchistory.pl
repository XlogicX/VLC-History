#!/usr/bin/perl
# recent_vlc
use warnings;
use strict;

my $list;
my $pattern;
my $answer;

chdir;
open IN, "logs/vlc.txt";

print "What Video do you want to know about?: ";
$pattern = <STDIN>;
chomp($pattern);

$/ = undef;
$list = <IN>;
$/ = "\n";

while ($list =~ /(\n[^\n]*)($pattern)([^\n]*[\n])/isg) {
	$answer = "$1$2$3";
}
print "$answer\n";
