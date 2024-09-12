#créer une fonction puissance prenant 2 arguments entiers a et b et qui va renvoyer le nombre entier ab.

def puissance(a,b):
	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	k=1
	if b>0:
		for count in range(b):
			k=k*a
		print(k)
		return k
	else : 
		for count in range(abs(b)):
			k=k*a
			o=1/k
		print(o)
		return o
	#print("le résultât de a puissance b :", k)
	
	

