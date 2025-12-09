'mandelbrot with zoom

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

public sub		draw_mandelbrot_set(xi as double, yi as double, _
									xf as double, yf as double)
	' calcolo delle iterazioni per il frattale di Mandelbrot
	'
	screenset 1,0
	'
	dim as integer n = 0,  m = 0, iterazioni = 0
	dim as double c_real,c_imm,z_real,z_imm,temp
	dim as double inc_x = abs(xf-xi)/(2*_XMAX_)
	dim as double inc_y = abs(yf-yi)/(2*_YMAX_)
	'
	'ScreenLock
	'
	for x as double = 0 to _XMAX_ step PRECISION
		c_real = xi + (n*inc_x)
		for y as double = _YMAX_  to 0 step -PRECISION
			iterazioni = 0
			z_imm = 0: z_real = 0
			c_imm = yi + (m*inc_y)
			while ((z_real^2 + z_imm^2 <= 4.0) and (iterazioni < MAX_ITER))
				temp = z_real^2 - z_imm^2 + c_real
				z_imm = 2*z_imm*z_real + c_imm
				z_real = temp
				iterazioni += 1
			wend
			pset (x,y), iterazioni
			m += 1
		next y
		n += 1
		m = 0
	next x
	'
	'ScreenUnlock
	'
end sub
public function	draw_zoombox(X as integer, Y as integer, z as single, _
							 byref xi as double, byref yi as double, _
							 byref xf as double, byref yf as double, _
							 button as integer) as boolean
	' disegna la zoom box ove sarà possibile zoomare
	'
	screenset 2,0
	'
	dim as integer Xri = X-_XMAX_/(2*z)	'coordinate assolute del rettangolo di zoom
	dim as integer Yri = Y-_YMAX_/(2*z) 'centrato sulle coordinate assolute del mouse (X,Y)
	dim as integer Xrf = X+_XMAX_/(2*z)
	dim as integer Yrf = Y+_YMAX_/(2*z)
	'
	cls
	line (Xri,Yri)-(Xrf,Yrf),15,B 	'disegna il rettangolo di zoom
	'
	dim as double xp
	dim as double yp
	
	if (button and SX_BUTTON) then
		'intanto calcolo il punto centrale del rettangolo di zoom corrispondente a (X,Y)
		xp = xi + X*abs(xf-xi)/_XMAX_			
		yp = yi + (_YMAX_-Y)*abs(yf-yi)/_YMAX_
		'
		'adesso calcolo i nuovi (xi,yi) e (xf,yf)
		xi = xp-abs(xf-xi)/(2*z)
		yi = yp-abs(yf-yi)/(2*z)
		'
		xf = xp+abs(xf-xi)/(2*z)
		yf = yp+abs(yf-yi)/(2*z)
		'
		'windowtitle " ("+left$(str$(X),6)+","+left$(str$(Y),6)+") -- ("+left$(str$(xp),6)+","+left$(str$(yp),6)+")"+" ("+left$(str$(xi),6)+","+left$(str$(yi),6)+")-("+left$(str$(xf),6)+","+left$(str$(yf),6)+")"
		'
		return TRUE
	else
		return FALSE
	end if
	'
end function
public sub 		title(X as integer, Y as integer,xi as double, yi as double, xf as double, yf as double, z as integer)
	windowtitle " ( "+left$(str$(xi),12)+" , "+left$(str$(yi),12)+" ) - ( "+left$(str$(xf),12)+" , "+left$(str$(yf),12)+" )"+" "+str$(z)+"x"
end sub

' ---- main

dim as single ZOOM = 2

dim as integer x,y,wheel,button

dim as double xi = -2.5, yi = -2.5	' valori di default
dim as double xf =  2.5, yf =  2.5

screenres _XMAX_, _YMAX_, 8, 3	'3 schermi (schermo 0 = visualizzazione, schermo 1 = draw mandelbrot, schermo 2 = draw zoombox)

draw_mandelbrot_set(xi,yi,xf,yf)

do
	if GetMouse(x,y,wheel,button,0) = 0 then
		'
		if wheel <> 0 then ZOOM = abs(wheel)
		'
		title(x,y,xi,yi,xf,yf,ZOOM)
		'
		if draw_zoombox(x,y,ZOOM,xi,yi,xf,yf,button) then
			'
			draw_mandelbrot_set(xi,yi,xf,yf)
			'
		else
			flip 2,0
			sleep 24
		end if
		'
		if MultiKey(SC_ESCAPE) then exit do
		'
		flip 1,0
		sleep 10
		'
	end if
loop until MultiKey(SC_ESCAPE)


end 0