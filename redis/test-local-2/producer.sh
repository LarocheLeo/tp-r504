#!/bin/bash

# Nombre d’éléments envoyés à chaque burst.
# Cela simule une charge importante et variable.
n=1000

# Pause entre deux bursts.
pause=3

# Test de connexion à Redis
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
    for ((i=0;i<n;i++))
    do
        redis-cli LPUSH listproject2 $RANDOM
    done

    # Affichage de la taille de la liste pour suivre la charge.
    taille=$(redis-cli --raw LLEN listproject2)
    echo "Taille actuelle de la liste : $taille"

    # Pause entre deux bursts.
    sleep $pause
done
