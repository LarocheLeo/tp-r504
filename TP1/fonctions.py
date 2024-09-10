#créer une fonction puissance prenant 2 arguments entiers a et b et qui va renvoyer le nombre entier ab.

def puissance(a,b):
	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
		
	k= a**b
	print("le résultât de a puissance b :", k)
