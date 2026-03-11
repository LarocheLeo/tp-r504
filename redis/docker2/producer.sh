#!/bin/bash

# variable 
PARAM=s_redis
n=1000
pause=3

redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi

while true 
do
	# Burst
	for ((i=0;i<n;i++))
	do
		redis-cli -h $PARAM LPUSH listdocker2 $RANDOM
	done

	# Affichage de la taille de la liste
	taille=$(redis-cli -h $PARAM --raw LLEN listdocker2)
	echo "Taille actuelle de la liste : $taille"

	# Pause
	sleep $pause
done 

