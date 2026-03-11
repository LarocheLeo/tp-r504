#!/bin/bash

TERM=x-terminal-emulator   # ou gnome-terminal selon ta distrib
iter=0
oldnb=0
nb=0

# Lancer le producer dans un terminal séparé
$TERM -t PRODUCER -e ./producer.sh &

while :
do

    # Taille actuelle de la file
    nb=$(redis-cli --raw LLEN listproject2)
    iter=$((iter+1))

    echo "- iter $iter, taille liste = $nb"

    # Q2.13 : stratégie auto-adaptative
    if [ $nb -gt $oldnb ]
    then
        echo "→ Lancement d'un nouveau consumer"
        $TERM -t CONSUMER -e ./consumer.sh &
    fi

    oldnb=$nb

    # Affichage du nombre de consumers actifs
    nbjobs=$(ps aux | grep consumer.sh | grep -v grep | wc -l)
    echo "Nb jobs en cours : $nbjobs"


    sleep 3
done
