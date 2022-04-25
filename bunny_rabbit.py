#!/usr/bin/env python
from itertools import permutations, combinations

def bunny(d):
    return (d['B'] * 10000 +
            d['U'] * 1000 +
            d['N'] * 100 +
            d['N'] * 10 +
            d['Y'])

def rabbit(d):
    return (d['R'] * 100000 +
            d['A'] * 10000 +
            d['B'] * 1000 +
            d['B'] * 100 +
            d['I'] * 10 +
            d['T'])

def is_result(b, r):
    return b * 2 == r

def show_result(b, r):
    print(f' {b}')
    print(f'+{b}')
    print(r)
    print()

variables = 'BUNYRAIT'
for c in combinations(range(10), 8):
    for p in permutations(variables):
        d = { z[0]: z[1] for z in zip(p, c) }
        if d['R'] != 1:
            continue
        b = bunny(d)
        r = rabbit(d)
        if is_result(b,r):
            show_result(b, r)
