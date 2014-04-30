#!/usr/bin/gnuplot
reset
set terminal pngcairo enhanced
set output 'V.png'

set style line 1 lc rgb '#204A87' lt 1 lw 1 # --- green


set pm3d depthorder hidden3d 1
set hidden3d

set style fill transparent solid 0.9
set palette rgb 9,7,1

unset colorbox

set ticslevel 0

set grid ztics 
set grid

unset key
set xlabel 'z'
set ylabel 'y'
set zlabel 'V'
set isosamples 30,30

set xtics ('-R' -1 ,0,'R' 1,'d' 3)
set ztics (0 , 'V_0' 0.3 )
set ytics ('-R' -1 ,0,'R' 1)

pi = 3.1415
e0=1
V0 = 0.3
R = 1
d = 3
q=1

V(x,y) = (1/(4*pi*e0)) *((R/d)*(-q/sqrt((x-R**2/d)**2 + y**2)) + q/sqrt((x-d)**2 +y**2) + 4*pi*e0*R*V0/sqrt(x**2 + y**2))

splot [x=-2:5] [y=-3:3] x**2 + y**2 > 1 ? V(x,y) : 1/0 notitle w pm3d 



