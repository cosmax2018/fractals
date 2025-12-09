
# mandelbrot_v0.py : Frattale di Mandelbrot

# CopyRight 2020 by Lumachina Software - @_°° Massimiliano Cosmelli (massimiliano.cosmelli@gmail.com)

import time
import pygame, sys, traceback
from pygame.locals import *
import itertools

from config_mandelbrot import *

pygame.init()
screen = pygame.display.set_mode((XRES,YRES))
s = pygame.Surface((RES,RES))	# the object surface of a dimension of RES x RES
r = s.get_rect()				# the 'pixel' at x,y

def terminate():
	pygame.quit()
	sys.exit()

def blockFill(x,y,color):
	s.fill((RED*color%256,GREEN*color%256,BLUE*color%256))
	r.x,r.y = -XRES/RES+x*RES,-YRES/RES+y*RES	# get an object rectangle from the object surface and place it at position x,y
	screen.blit(s,r)

def mandelbrot(z0,num):
	# runs the process num times
	# returns the diverge count
	iter = 0
	z = z0
	# iterate num times
	while iter <= num:
		# check for divergence
		if abs(z) > 2:	return iter
		# iterate z
		z = z*z + z0
		iter += 1
	return iter

def draw(xi,xf,yi,yf):
	inc_x = abs(xf-xi)/XRES
	inc_y = abs(yf-yi)/YRES
	for x in range(XRES):
		z_real = xi+x*inc_x
		for y in range(YRES):
			z_img = yi+y*inc_y
			blockFill(x,y,mandelbrot(complex(z_real,z_img),MAX_ITER))	

def main():

	pygame.display.set_caption(f'Mandelbrot v.0 (c)2020 by Lumachina Software - @_°°       ({xi},{yi})-({xf},{yf})')
	
	draw(xi,xf,yi,yf)
	
	pygame.display.flip()		# update the entire pygame display
		
	x = input()
	
	terminate()
			
# call main
if __name__ == '__main__':
    main()

