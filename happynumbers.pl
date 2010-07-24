#!/usr/bin/perl -w
# ---------------------------------------------------------------
# $Id$
# vim: sw=4 ts=4 ai si et
# ---------------------------------------------------------------
#
# Module:   
# $Revision$
#
# About:	Programming praxis 'Happy Numbers' exercise
# http://programmingpraxis.com/2010/07/23/happy-numbers/
#
# ---------------------------------------------------------------

use strict;
use warnings;

my $limit = $ARGV[0];
die "Need an integer limit as arg0\n" unless $limit and $limit =~ /^\d+$/;

sub ishappy ($) {
    my ($n) = @_;

    my %seen;

    while (1) {
        my @digits = getdigits($n);

        # end on '1'
        last if scalar(@digits) == 1 and $digits[0] == 1;

        # store digits sorted so 58 == 85
        my $d = join('', sort @digits);
        last if $seen{$d};
        $seen{$d} = 1;

        $n = 0;
        map { $n += $_*$_ } @digits;

        print join ' + ', map { "$_^2" } @digits;
        print " = $n\n";
    }

    return ($n == 1);
}

sub getdigits ($) {
    my ($n) = @_;

    my @digits;
    while ($n > 9) {
        my $o = int($n / 10);
        push @digits, $n - 10 * $o;
        $n = int($n / 10);
    }

    push @digits, $n;

    return @digits;
}

if (ishappy($limit)) {
    print "$limit is happy!\n";
}
else {
    print "$limit is sad :(\n";
}


