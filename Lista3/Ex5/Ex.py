import math

s = ''

MAX = 1
Xmax = 100
Ymax = 100

for i in range(-Xmax,Xmax):
	y = i*1e-2
	for j in range(-Ymax,Ymax):
		z = j*1e-2
		s+=str( 1/ pow(1 + pow(y,2) + pow(z,2) , 3/2 ) )+"\t"
	print s
	s=''
