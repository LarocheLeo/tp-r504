#a = int(input("premier nombre :" ))
#b = int(input("second nombre :" ))

def puissance(a,b) : 


	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	c = 1
	if a == 0 and b < 0: # petit test pour faire fonctionner le test sur la division par zero car sinon se n'est pas valide 
		print("ce calcul ne peut pas être fait") 
		return 1/0  #bien que c'est une erreur, cette ligne est importante ! elle permet de faire fonctionner le test et la suite de ce programme
	
	if b>=0 : # calcul de puissance plus complexe  
		for i in range(b) : #si b est postif alors on fait ce calcul 

			c = c*a 
		print(c)
		return c 
	else : 

		for i in range(b) : #sinon, si b est bien négatif, on fait ce calcul et on verrifie si ce n'est pas une dévision par 0
			c = c*a 
			d = 1/c #peut fonctionner grâce à return 1/0
		print(d)
		return d

	#c = a**b #calcule de puissance classique 
	#print("le nombre entier a puissance b est :", c ) 
	#return c

