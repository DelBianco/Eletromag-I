import math 

def r(x,y):
	return pow(pow(x,2)+pow(y,2) , 0.5)

def V(x,y):
	return -pow(r(x,y),4)/4

s = ''

MAX = 1
Xmax = 200
Ymax = 200
for i in range(Xmax):
	for j in range(Ymax):
		s += str((V(i-Xmax/2,j-Ymax/2))/MAX) + "\t"
	print s
	s=''
