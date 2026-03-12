#!/bin/bash

# Nom du conteneur Redis dans le réseau Docker.
# Ici, Redis n'est plus en local : il tourne dans un autre conteneur.
# On utilise donc son hostname Docker défini dans start.sh.
PARAM=s_redis

# Nombre d’éléments envoyés à chaque burst.
# Cela simule une charge importante sur Redis.
n=1000

# Pause entre deux bursts.
# Permet de réguler la production et d’observer la montée en charge.
pause=3

# Test de connexion à Redis.
# On utilise -h $PARAM car Redis n'est plus sur localhost.
redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

# Boucle infinie : le producteur génère des données en continu.
# Dans un système distribué, le producer joue le rôle de "générateur de charge".
while true
do
    # Burst d’insertion : on pousse n valeurs aléatoires dans la liste.
    # LPUSH ajoute à gauche, ce qui est cohérent avec RPOP côté consumer.
    for ((i=0;i<n;i++))
    do
        redis-cli -h $PARAM LPUSH listdocker1 $RANDOM
    done

    # On affiche la taille actuelle de la liste pour suivre l’évolution de la charge.
    taille=$(redis-cli -h $PARAM --raw LLEN listdocker1)
    echo "Taille actuelle de la liste : $taille"

    # Pause entre deux bursts pour éviter de saturer Redis trop vite.
    sleep $pause
done
