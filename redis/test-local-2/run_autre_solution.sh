#!/bin/bash

TERM=x-terminal-emulator
iter=0
oldnb=0

$TERM -T PRODUCER -e bash -c "./producer.sh" &

while :
do
    nb=$(redis-cli --raw LLEN listproject2)
    iter=$((iter+1))

    echo "- iter $iter, taille liste = $nb"

    delta=$((nb - oldnb))

    if [ $delta -gt 0 ]; then
        # seuil plus petit pour détecter les variations
        k=$((delta / 200 + 1))

        echo "→ File +$delta éléments, lancement de $k consumers"

        for ((i=0; i<k; i++)); do
            $TERM -T CONSUMER -e bash -c "./consumer.sh" &
        done
    fi

    oldnb=$nb

    nbjobs=$(ps aux | grep consumer.sh | grep -v grep | wc -l)
    echo "Nb jobs en cours : $nbjobs"

    sleep 3
done
