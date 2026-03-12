#!/bin/bash

# PARAM contient ici l’URL complète de connexion à Redis Cloud.
# On utilise l’option -u de redis-cli pour fournir :
#   - l’utilisateur (default)
#   - le mot de passe
#   - l’hôte Redis Cloud
#   - le port
#
# Cette URL est fournie par Redis Cloud dans l’interface.
PARAM=-u "redis://default:********@redis-xxxxx:12345"

# Paramètres métier
threshold=30000      # seuil d’alarme
delay_process=4      # pause en cas d’alarme
empty_wait=2         # attente si la liste est vide

# Test de connexion à Redis Cloud.
# Si la connexion échoue, on arrête immédiatement le script.
redis-cli $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur Redis Cloud !"
    exit 1
fi

# Boucle principale : le consumer dépile et traite les valeurs en continu.
while true
do
    # Récupération de la taille de la liste.
    # --raw permet d’éviter les guillemets dans la sortie.
    nb=$(redis-cli $PARAM --raw LLEN listdocker2)

    if [ $nb -gt 0 ]
    then
        # On dépile un élément depuis Redis Cloud.
        value=$(redis-cli $PARAM --raw RPOP listdocker2)

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
