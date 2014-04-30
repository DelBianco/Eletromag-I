#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf

reset

set terminal pngcairo enhanced

set output 'Sigma.png'

set xrange [-100:100]
set yrange [-100:100]

set samples 100   # x-axis
set isosamples 100 # y-axis

load "/home/andre/Downloads/gnuplot-colorbrewer-master/sequential/Blues.plt"

set xlabel 'y'
set ylabel 'z'
unset colorbox

plot "Sig.dat" u (($1-100)):(($2-100)):3 matrix with image
