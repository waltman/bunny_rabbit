#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.34);
use experimental qw(signatures);
use Algorithm::Combinatorics qw(permutations combinations);

# solve BUNNY + BUNNY = RABBIT
my @var = split '', 'BUNYRAIT';

my $citer = combinations([0..9], 8);
while (my $c = $citer->next) {
    my $piter = permutations(\@var);
    while (my $p = $piter->next) {
        my %h = map { $p->[$_] => $c->[$_] } 0..7;
        next unless $h{R} == 1;
        my $bunny = bunny(%h);
        my $rabbit = rabbit(%h);
        show_result($bunny, $rabbit) if is_result($bunny, $rabbit);
    }
}

sub bunny(%h) {
    return "$h{B}$h{U}$h{N}$h{N}$h{Y}";
}

sub rabbit(%h) {
    return "$h{R}$h{A}$h{B}$h{B}$h{I}$h{T}";
}

sub is_result($bunny, $rabbit) {
    return $bunny * 2 == $rabbit;
}

sub show_result($bunny, $rabbit) {
    say " $bunny";
    say "+$bunny";
    say $rabbit;
    say '';
}
