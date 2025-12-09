'Julia set with interactive zoom

#include "fbgfx.bi"
#if __FB_LANG__ = "fb"
Using FB '' Scan code constants are stored in the FB namespace in lang FB
#endif

const _XMAX_ = 640, _YMAX_ = 480
const MAX_ITER = 256			' profondita' di iterazione
const PRECISION = .5			' precisione nel disegno

enum
	SX_BUTTON = 1
	DX_BUTTON
end enum

public sub		draw_julia_set(xi as double, yi as double, _
							   xf as double, yf as double, _
							   cr as double, ci as double)
	' calcolo delle iterazioni per il frattale di Julia
	dim as double d, d1
	dim as integer	n = 0,  m = 0, iterazioni = 0
	dim as double z_real,z_imm,z_real_temp
	dim as double inc_x = abs(xf-xi)/(2*_XMAX_)
	dim as double inc_y = abs(yf-yi)/(2*_YMAX_)
	'
	ScreenLock
	'
	for x as double = 0 to _XMAX_ step PRECISION
		for y as double = _YMAX_  to 0 step -PRECISION
			iterazioni = 0			
			d = 0 : d1 = 1
			z_real = xi + (n*inc_x)
			z_imm = yi + (m*inc_y)
			while ((d <= 4.0) and (iterazioni < MAX_ITER) and (abs(d-d1)>.000001))
				d1 = d
				z_real_temp = z_real^2 - z_imm^2 + cr
				z_imm = 2*z_imm*z_real + ci
				z_real = z_real_temp
				d = z_real^2 + z_imm^2
				iterazioni += 1
			wend
			pset (x,y), iterazioni
			m += 1
		next y
		n += 1
		m = 0
	next x
	'
	ScreenUnlock
	'
end sub
public function	draw_zoombox(X as integer, Y as integer, z as single, _
							 byref xi as double, byref yi as double, _
							 byref xf as double, byref yf as double, _
							 button as integer) as boolean
	' disegna la zoom box ove sarà possibile zoomare
	'
	if (button and SX_BUTTON) then
		'intanto calcolo il punto centrale del rettangolo di zoom corrispondente a (X,Y)
		dim as double xp = xi + X*abs(xf-xi)/_XMAX_			
		dim as double yp = yi + (_YMAX_-Y)*abs(yf-yi)/_YMAX_
		'
		'adesso calcolo i limiti (xi,yi)-(xf,yf) della nuova finestra grafica
		xi = xp-abs(xf-xi)/(2*z)
		yi = yp-abs(yf-yi)/(2*z)
		xf = xp+abs(xf-xi)/(2*z)
		yf = yp+abs(yf-yi)/(2*z)
		'
		return TRUE
	else
		return FALSE
	end if
	'
end function
public sub 		title(X as integer, Y as integer,xi as double, yi as double, xf as double, yf as double, z as integer)
	' mostra i limiti (xi,yi)-(xf,yf) della finestra grafica e il livello di zoom
	windowtitle " ( "+left(str(xi),12)+" , "+left(str(yi),12)+" ) - ( "+left(str(xf),12)+" , "+left(str(yf),12)+" )"+" "+str(z)+"x"
end sub

' ---- main

dim as single ZOOM = 2
dim as integer x,y,wheel,button
dim as double xi = -1.6, yi = -1.2	' valori iniziali di default per la finestra grafica
dim as double xf =  1.6, yf =  1.22
dim as double cr = 0.3182 '-1.0				' valori iniziali del seme c
dim as double ci = 0.04 '0.26

screenres _XMAX_, _YMAX_, 8 

draw_julia_set(xi,yi,xf,yf,cr,ci)

do
	if GetMouse(x,y,wheel,button,0) = 0 then
	
		if wheel <> 0 then ZOOM = abs(wheel)	'girando la rotellina del mouse vario lo zoom

		title(x,y,xi,yi,xf,yf,ZOOM)

		if draw_zoombox(x,y,ZOOM,xi,yi,xf,yf,button) then
			draw_julia_set(xi,yi,xf,yf,cr,ci)
		end if

		if MultiKey(SC_ESCAPE) then exit do

		'sleep 100
	end if
loop until MultiKey(SC_ESCAPE)

end 0