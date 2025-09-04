#a = int(input("premier nombre :" ))
#b = int(input("second nombre :" ))

def puissance(a,b) : 


	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	c = 1 
	for i in range(b) :

		c = c*a 
	





	#c = a**b 
	print("le nombre entier a puissance b est :", c ) 
	return c

