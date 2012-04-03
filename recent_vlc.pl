#!/usr/bin/perl
# recent_vlc
use warnings;
use strict;

my @videos;
my $last_vid;
my $list;

chdir;
open IN, ".config/vlc/vlc-qt-interface.conf";
open VLCIN, "logs/vlc.txt";
open OUT, ">>logs/vlc.txt";

@videos = <IN>;
$last_vid = $videos[5];

$/ = undef;
$list = <VLCIN>;
$/ = "\n";
close VLCIN;

if ($last_vid =~ /(list=)([^,]+[^,])(, \/)/) {
	if ($list !~ $2) {
		print OUT "$2\n";
	}
}
