print("Hello, World!")

"""
while True :
	print('rentrer un nombre :')
	i = int(input())
	a=i*i
	print('le carré du nombre rentrer est, ' , a)
"""

import fonctions as f 

a = int(input("premier nombre :" ))
b = int(input("second nombre :" ))
res = f.puissance(a,b) 
