#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf


reset

set terminal pngcairo enhanced
set output 'Field2.png'

set xrange [-1:1]
set yrange [-1:1]

set size ratio -1
set samples 12    # x-axis
set isosamples 12 # y-axis

load 'YlGnBu.plt'

set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12



set style line 1 lc rgb '#8b1a0e' pt 7 lt 1 lw 2 pi -1 ps 1.5 # --- red
set style line 7 lc rgb '#BF3030' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- red1
set style line 8 lc rgb '#FF3030' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- red2

set style line 2 lc rgb '#5e9c36' pt 7 lt 2 lw 2 pi -1 ps 1.5 # --- green
set style line 9 lc rgb '#238b49' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- green1
set style line 10 lc rgb '#B0F260' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- green2

set style line 3 lc rgb '#A9BDE6' pt 7 lt 2 lw 2 pi -1 ps 1.5 # --- blue
set style line 11 lc rgb '#2A4480' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- blue1
set style line 12 lc rgb '#06266FF' pt 7 lt 7 lw 2 pi -1 ps 1.5 # --- blue2

set style line 4 lc rgb '#F9C96D' pt 7 lt 2 lw 2 pi -1 ps 1.5 # --- brown

set style line 5 lc rgb '#c3c3c3' pt 7 lt 2 lw 2 pi -1 ps 1.5 # --- gray

set style line 6 lc rgb '#E47833' pt 7 lt 2 lw 2 pi -1 ps 1.5 # --- orange
set style line 13 lc rgb '#FFB540' pt 7 lt 3 lw 2 pi -1 ps 1.5 # --- orange1
set style line 14 lc rgb '#FFD300' pt 7 lt 6 lw 2 pi -1 ps 1.5 # --- orange2

# function for two sources with different charges
r(x,y)     = sqrt(x*x+y*y)
# potentials
v1(x,y)    = q1*5*(r(x-x01,y-y01))**3

v(x,y)     = v1(x,y)
# sources
e1x(x,y)   = 5*q1*x*r(x,y)**3
e1y(x,y)   = 5*q1*y*r(x,y)**3
ex(x,y)    = e1x(x-x01,y-y01)
ey(x,y)    = e1y(x-x01,y-y01)
enorm(x,y) = sqrt(ex(x,y)**2 + ey(x,y)**2)
# vector functions
dx(x,y)    = scaling*ex(x,y)
dy(x,y)    = scaling*ey(x,y)

# source parameters
x01 = 0
y01 = 0
q1 = 1
scaling = 0.02
set xtics ('-100' -1 , '-50' -0.5 , '0' 0 , '50' 0.5 , '100' 1)
set ytics ('-100' -1 , '-50' -0.5 , '0' 0 , '50' 0.5 , '100' 1)

set cbtics format "%g"

plot '++' u ($1-dx($1,$2)/2.0):($2-dy($1,$2)/2.0):(dx($1,$2)):(dy($1,$2)):1 with vectors ls 2 head size 0.08,20,60  notitle
