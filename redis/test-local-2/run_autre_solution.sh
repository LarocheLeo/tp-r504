#!/bin/bash

TERM=x-terminal-emulator
iter=0
oldnb=0

# Lancement du producer
$TERM -T PRODUCER -e bash -c "./producer.sh" &

while :
do
    # Taille actuelle de la liste
    nb=$(redis-cli --raw LLEN listproject2)
    iter=$((iter+1))

    echo "- iter $iter, taille liste = $nb"

    # Variation de la taille de la liste
    delta=$((nb - oldnb))

    if [ $delta -gt 0 ]; then
        # Stratégie plus fine :
        # On lance k consumers proportionnellement à la croissance de la file.
        # Exemple : si la file augmente de 600 → k = 600/200 + 1 = 4 consumers
        k=$((delta / 200 + 1))

        echo "→ File +$delta éléments, lancement de $k consumers"

        for ((i=0; i<k; i++)); do
            $TERM -T CONSUMER -e bash -c "./consumer.sh" &
        done
    fi

    oldnb=$nb

    # Affichage du nombre de consumers actifs
    nbjobs=$(ps aux | grep consumer.sh | grep -v grep | wc -l)
    echo "Nb jobs en cours : $nbjobs"

    sleep 3
done
