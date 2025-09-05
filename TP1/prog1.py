print("Hello, World!")

"""
while True :
	print('rentrer un nombre :')
	i = int(input())
	a=i*i
	print('le carré du nombre rentrer est, ' , a)
"""

import fonctions_entier_flottant as f 

a_input = input("premier nombre :" ) #on demande n'importe quelle nombre tant qu'il est correcte
b_input = input("second nombre :" )
#a = float(input("premier nombre :" ))
#b = float(input("second nombre :" ))
try:
	# On tente float d'abord car il accepte aussi les int
	a = float(a_input) # on teste d'abord si, le nombre choissi est flottant
	b = float(b_input)

	# Si ce sont des entiers (pas de virgule), on les convertit pour qu'il puissent être utiliser avec int
	if a.is_integer(): 
		a = int(a)
	if b.is_integer():
		b = int(b)
except ValueError: # si ! la valeur qu'on à demander n'est pas un nombre que sa soit a, b ou les deux. On envoie l'erreur.
    print("Erreur : Veuillez entrer des nombres valides.")
    exit()  # quitte le programme si erreur

res = f.puissance2(a,b) 
