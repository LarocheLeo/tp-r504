#!/bin/bash

TERM=x-terminal-emulator   # Terminal utilisé pour lancer les scripts
iter=0                     # Compteur d’itérations
oldnb=0                    # Taille précédente de la liste
nb=0                       # Taille actuelle

# Lancer le producer dans un terminal séparé
$TERM -t PRODUCER -e ./producer.sh &

while :
do
    # Taille actuelle de la file
    nb=$(redis-cli --raw LLEN listproject2)
    iter=$((iter+1))

    echo "- iter $iter, taille liste = $nb"

    # Stratégie auto-adaptative simple :
    # Si la liste grossit, cela signifie que les consumers actuels
    # ne suffisent plus → on en lance un nouveau.
    if [ $nb -gt $oldnb ]
    then
        echo "→ Lancement d'un nouveau consumer"
        $TERM -t CONSUMER -e ./consumer.sh &
    fi

    # Mise à jour de la taille précédente
    oldnb=$nb

    # Affichage du nombre de consumers actifs
    nbjobs=$(ps aux | grep consumer.sh | grep -v grep | wc -l)
    echo "Nb jobs en cours : $nbjobs"

    sleep 3
done
