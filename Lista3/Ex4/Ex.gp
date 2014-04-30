#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf

reset

set terminal pngcairo enhanced

set output 'V.png'

set style line 1 lc rgb '#204A87' lt 1 lw 1 # --- green


set pm3d depthorder hidden3d 1
set hidden3d

set style fill transparent solid 0.65
set palette rgb 9,7,1

unset colorbox

set ticslevel 0
unset key
set xlabel 'x'
set ylabel 'y'
set zlabel 'V'
set isosamples 20,20

V(x,y) = -1/sqrt((x+1)**2 + y**2) + 1/sqrt((x-1)**2 + y**2)

splot [x=-2:4] [y=-3:3] x>0 ? V(x,y) : 0 notitle w pm3d
