
' sierp1.bas - frattale di Sierpinski

dim as integer _XMAX_ = 640, _YMAX_ = 480

' ---- main

randomize timer

screenres _XMAX_, _YMAX_, 8

dim as integer r
dim as integer x = 100, y = 100
dim as integer ux = 150, uy = 30

for i as integer = 1 to 100000
	r = cint(rnd()*3)
	if r = 1 then ux = 30:uy = 1000
	if r = 2 then ux = 1000:uy = 1000
	x = (x+ux)/2
	y = (y+uy)/2
	pset (x,y),15
next i

sleep

end 0
