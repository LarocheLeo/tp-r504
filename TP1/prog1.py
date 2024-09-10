#test prog
#print ( " Hello , World ! " )

#fonction carrée

import fonctions as f


i = 0
while i < 1 :
	a= float(input("choisir un nombre a:"))
	b= int(input("choisir un nombre b:"))
	res = f.puissance(a,b)
	o = a * a
	p = b * b
	print("le carré de a est :", o)
	print("le carré de a est :", p)


