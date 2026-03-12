#!/bin/bash

# Nombre d’éléments envoyés à chaque burst.
# Cela permet de simuler une charge variable sur Redis.
n=1000

# Pause entre deux bursts : permet de réguler la production
pause=3

# Test de connexion à Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi

# Boucle infinie : le producteur génère des données en continu
while true 
do
	# Burst d’insertion : on pousse n valeurs aléatoires dans la liste.
    # LPUSH ajoute à gauche, ce qui est cohérent avec un RPOP côté consumer.
	for ((i=0;i<n;i++))
	do
		redis-cli LPUSH listproject $RANDOM
	done

	# On affiche la taille actuelle de la liste pour suivre l’évolution du système.
	taille=$(redis-cli --raw LLEN listproject)
	echo "Taille actuelle de la liste : $taille"

	# Pause entre deux bursts pour éviter de saturer Redis trop vite.
	sleep $pause
done 

