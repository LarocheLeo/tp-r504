#a = int(input("premier nombre :" ))
#b = int(input("second nombre :" ))

def puissance(a,b) : 


	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	c = 1
	if a == 0 and b < 0:
		return 1/0 
	if a>=0 :  
		for i in range(b) :

			c = c*a 
		print(c)
		return c 
	else : 

		for i in range(abs(b)) : 
			c = c*a 
			d = 1/c
		print(d)
		return d

	#c = a**b 
	#print("le nombre entier a puissance b est :", c ) 
	#return c

