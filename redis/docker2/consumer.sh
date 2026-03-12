#!/bin/bash

# Nom du service Redis défini dans docker-compose.yml.
# Avec Docker Compose, chaque service devient automatiquement un hostname.
PARAM=s_redis

# Paramètres métier
threshold=30000      # seuil d’alarme
delay_process=4      # pause en cas d’alarme
empty_wait=2         # attente si liste vide

# Test de connexion à Redis.
# Ici, Redis tourne dans un autre conteneur mais sur le même réseau Docker Compose.
redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

# Boucle principale : le consumer traite les données en continu
while true
do
    # On récupère la taille de la liste dans Redis.
    nb=$(redis-cli -h $PARAM --raw LLEN listdocker2)

    if [ $nb -gt 0 ]
    then
        # On dépile un élément depuis Redis.
        value=$(redis-cli -h $PARAM --raw RPOP listdocker2)

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
