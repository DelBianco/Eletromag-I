#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf

reset

set terminal pngcairo enhanced

set output 'Field1.png'

set xrange [-100:100]
set yrange [-100:100]

set samples 100   # x-axis
set isosamples 100 # y-axis

load 'YlGnBu.plt'

set cbtics format "%2.0t x 10^{%L}"

plot "MatRho.dat" u (($1-100)):(($2-100)):3 matrix with image
