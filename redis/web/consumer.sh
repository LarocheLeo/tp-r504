#!/bin/bash
# variable 
PARAM=-u "redis://default:++++++
threshold=30000
delay_process=4
empty_wait=2

redis-cli $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi

while true 
do
	# Récupération de la taille de la liste
	nb=$(redis-cli $PARAM --raw LLEN listdocker2)
    if [ $nb -gt 0 ]
    then
        # Dépiler un élément
        value=$(redis-cli $PARAM --raw RPOP listdocker2)

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

