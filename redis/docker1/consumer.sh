#!/bin/bash

# Nom du conteneur Redis dans le réseau Docker.
# Ici, Redis n'est plus en local : il tourne dans un autre conteneur.
# On utilise donc son hostname Docker, défini dans start.sh.
PARAM=s_redis

# Paramètres métier
threshold=30000      # seuil d’alarme
delay_process=4      # pause en cas d’alarme
empty_wait=2         # attente si liste vide

# Test de connexion à Redis.
# Ici, -h $PARAM est indispensable car Redis n'est plus sur localhost.
redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

# Boucle principale : le consumer tourne en continu
while true
do
    # On récupère la taille de la liste dans Redis.
    # --raw évite les guillemets et formats parasites.
    nb=$(redis-cli -h $PARAM --raw LLEN listdocker1)

    if [ $nb -gt 0 ]
    then
        # On dépile un élément depuis Redis.
        # RPOP cohérent avec LPUSH côté producer.
        value=$(redis-cli -h $PARAM --raw RPOP listdocker1)

        echo "Valeur dépilée : $value"

        # Si la valeur dépasse le seuil, on simule un traitement plus long.
        if [ $value -gt $threshold ]
        then
            echo "ALARME ! Valeur = $value"
            sleep $delay_process
        fi

    else
        # Si la liste est vide, on attend un peu pour éviter de spammer Redis.
        echo "Liste vide, attente 2s."
        sleep 2
    fi
done
