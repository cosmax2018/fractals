# esempio di ricorsione disegnando un albero frattale con la turtle-graph
import turtle

def albero(n,d):
	if n == 0:
		return
	if n == 1:
		turtle.forward(d)
		turtle.backward(d)
	else:
		turtle.forward(d)
		turtle.left(30)
		albero(n-1,d-d/10)
		turtle.right(60)
		albero(n-1,d-d/10)
		turtle.left(30)
		turtle.backward(d)

def main():
	turtle.setheading(90)
	turtle.backward(200)
	turtle.speed(0)
	turtle.pensize(5)
	n = eval(input("Di quanti livelli vuoi che sia l'albero ?"))
	d = eval(input("Di che lunghezza iniziale vuoi che siano i rami dell'albero ?"))
	albero(n,d)	# un albero con n livelli di rami
	r = input('Per uscire premi Enter/Invio')
	
main()