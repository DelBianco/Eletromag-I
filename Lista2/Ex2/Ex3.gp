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
r(x,y,z)     = sqrt(x*x+y*y+z*z)
# potentials
v1(x,y,z)    = q1/(r(x-x01,y-y01,z-z0))
v2(x,y,z)    = q2/(r(x-x02,y-y02,z-z0))
v(x,y,z)     = v1(x,y,z)+v2(x,y,z)
# sources
e1x(x,y,z)   = q1*x/r(x,y,z)**3
e1y(x,y,z)   = q1*y/r(x,y,z)**3
e2x(x,y,z)   = q2*x/r(x,y,z)**3
e2y(x,y,z)   = q2*y/r(x,y,z)**3
ex(x,y,z)    = e1x(x-x01,y-y01,z-z0)+e2x(x-x02,y-y02,z-z0)
ey(x,y,z)    = e1y(x-x01,y-y01,z-z0)+e2y(x-x02,y-y02,z-z0)
enorm(x,y,z) = sqrt(ex(x,y,z)**2 + ey(x,y,z)**2)
# vector functions
dx(x,y,z)    = scaling*ex(x,y,z)/enorm(x,y,z)
dy(x,y,z)    = scaling*ey(x,y,z)/enorm(x,y,z)

# source parameters
x01 = 1
y01 = 0
q1 = 1
z0 = 0
x02 = -1
y02 = 0
q2 = -1
scaling = .22

plot '+++' u ($1-dx($1,$2,$3)/2.0):($2-dy($1,$2,$3)/2.0):(dx($1,$2,$3)):(dy($1,$2,$3)):\
    (v($1,$2,$3)) notitle with vectors head size 0.08,20,60 filled lc palette
