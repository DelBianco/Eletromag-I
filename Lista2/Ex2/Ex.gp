#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf

reset

set terminal pngcairo enhanced
set output 'Field.png'

#unset key
#set border 0
#unset tics
#unset colorbox
set xrange [-2:2]
set yrange [-1.7647:1.7647]
# get an equal grid
set size ratio -1
set samples 17    # x-axis
set isosamples 15 # y-axis

load "/home/andre/Downloads/gnuplot-colorbrewer-master/diverging/RdBu.plt"

# function for two sources with different charges
r(x,y)     = sqrt(x*x+y*y)
# potentials
v1(x,y)    = q1/(r(x-x01,y-y01))
v2(x,y)    = q2/(r(x-x02,y-y02))
v(x,y)     = v1(x,y)+v2(x,y)
# sources
e1x(x,y)   = q1*x/r(x,y)**3
e1y(x,y)   = q1*y/r(x,y)**3
e2x(x,y)   = q2*x/r(x,y)**3
e2y(x,y)   = q2*y/r(x,y)**3
ex(x,y)    = e1x(x-x01,y-y01)+e2x(x-x02,y-y02)
ey(x,y)    = e1y(x-x01,y-y01)+e2y(x-x02,y-y02)
enorm(x,y) = sqrt(ex(x,y)**2 + ey(x,y)**2)
# vector functions
dx(x,y)    = scaling*ex(x,y)/enorm(x,y)
dy(x,y)    = scaling*ey(x,y)/enorm(x,y)

# source parameters
x01 = 1
y01 = 0
q1 = 1
x02 = -1
y02 = 0
q2 = -1
scaling = .22

plot '++' u ($1-dx($1,$2)/2.0):($2-dy($1,$2)/2.0):(dx($1,$2)):(dy($1,$2)):\
    (v($1,$2)) notitle with vectors head size 0.08,20,60 filled lc palette
