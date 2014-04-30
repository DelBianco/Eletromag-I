import math

s = ''

MAX = 1
Xmax = 50
Ymax = 50
k=0.25
q=1
x0=5.5
d = 10

s=''
for j in range(-Ymax,Ymax):
	
	V = round(k*q/abs(j -x0))
	V +=round(k*q/abs(j +x0))
	V += round(k*q/abs(j -x0))
	for j in range(-Ymax,Ymax):
		s+= str(V)+'\t'
	print s
	s=''
