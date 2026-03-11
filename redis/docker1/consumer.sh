#!/bin/bash

PARAM=s_redis
threshold=30000      # seuil d’alarme
delay_process=4      # pause en cas d’alarme
empty_wait=2         # attente si liste vide

redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi

while true 
do
	# Récupération de la taille de la liste
	nb=$(redis-cli -h $PARAM --raw LLEN listdocker1)
    if [ $nb -gt 0 ]
    then
        # Dépiler un élément
        value=$(redis-cli -h $PARAM --raw RPOP listdocker1)

        echo "Valeur dépilée : $value"

        # Test du seuil
        if [ $value -gt $threshold ]
        then
            echo "ALARME ! Valeur = $value"
            sleep $delay_process
        fi

    else
        echo "Liste vide, attente 2s."
        sleep 2
    fi
done

