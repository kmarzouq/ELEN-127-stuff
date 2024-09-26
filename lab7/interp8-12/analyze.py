import csv
import re

x=[]
y=[]

def div (x,y):
	if (x==y or x==0):
		return 0
	else:
		return (y-x)/x

with open('outputwave.csv', 'r') as file:
	lines = file.readlines()

for line in lines:
	x.append(int(line))

with open('outwave1.txt', 'r') as file:
	lines2 = file.readlines()

for line in lines2:
	y.append(int(line))


for i in range(0,200):
	print(x[i],y[i],div(x[i],y[i]))




