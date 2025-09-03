#a = int(input("premier nombre :" ))
#b = int(input("second nombre :" ))

def puissance() : 
	a = int(input("premier nombre :" ))
	b = int(input("second nombre :" ))

	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")

	c = a**b 
	print("le nombre entier a puissance b est :", c ) 


