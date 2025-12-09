# esempio di ricorsione disegnando triangoli frattali di Sierpinski con la turtle-graph
import turtle

def triangolo(d):
	for i in [1,2,3]:
		turtle.forward(d)
		turtle.left(120)

def sierpinski(n,d):
	if n == 0:
		triangolo(d)
	else:
		# primo triangolo
		sierpinski(n-1,d/2)
		turtle.forward(d/2)
		# secondo triangolo
		sierpinski(n-1,d/2)
		turtle.backward(d/2)
		# terzo triangolo (in alto)
		turtle.left(60)
		turtle.forward(d/2)
		turtle.right(60)
		sierpinski(n-1,d/2)
		turtle.left(60)
		turtle.backward(d/2)
		turtle.right(60)
		
def main():
	turtle.speed(0)
	turtle.pensize(1)
	n = eval(input("Di quanti livelli annidati di triangoli vuoi ?"))
	d = eval(input("Di che lunghezza iniziale vuoi che sia il lato ?"))
	turtle.penup()
	turtle.backward(d/2)
	turtle.right(90)
	turtle.forward(d/2)
	turtle.left(90)
	turtle.pendown()
	sierpinski(n,d)
	r = input('Per uscire premi Enter/Invio')
	
main()
