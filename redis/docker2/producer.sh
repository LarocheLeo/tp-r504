#!/bin/bash

# Nom du service Redis défini dans docker-compose.yml.
PARAM=s_redis

# Nombre d’éléments envoyés à chaque burst.
n=1000

# Pause entre deux bursts.
pause=3

# Test de connexion à Redis.
redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

# Boucle infinie : le producteur génère des données en continu.
while true
do
    # Burst d’insertion : on pousse n valeurs aléatoires dans la liste.
    for ((i=0;i<n;i++))
    do
        redis-cli -h $PARAM LPUSH listdocker2 $RANDOM
    done

    # On affiche la taille actuelle de la liste pour suivre l’évolution de la charge.
    taille=$(redis-cli -h $PARAM --raw LLEN listdocker2)
    echo "Taille actuelle de la liste : $taille"

    # Pause entre deux bursts.
    sleep $pause
done
