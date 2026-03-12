#!/bin/bash

# variable 
PARAM=-u "redis://default:YwDcNmKxZfjO5w8uCWEV839oaEBWSYOS@redis-11321.crce202.eu-west-3-1.ec2.cloud.redislabs.com:11321"
n=1000
pause=3

redis-cli $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi

while true 
do
	# Burst"
	for ((i=0;i<n;i++))
	do
		redis-cli $PARAM LPUSH listdocker2 $RANDOM
	done

	# Affichage de la taille de la liste
	taille=$(redis-cli $PARAM --raw LLEN listdocker2)
	echo "Taille actuelle de la liste : $taille"

	# Pause
	sleep $pause
done 

