#!/bin/bash

# Seuil d’alarme : si une valeur dépilée dépasse ce seuil,
# on simule un traitement plus long (ex : anomalie détectée).
threshold=30000

# Temps d’attente en cas d’alarme
delay_process=4

# Temps d’attente si la liste est vide (ici non utilisé car on quitte)
empty_wait=2

# Test de connexion à Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    # Ici, je ne fais pas d'affichage volontairement car ce consumer
    # peut être lancé automatiquement par le script run.sh.
    exit 1
fi

# Boucle principale : le consumer traite la liste tant qu’il y a du travail
while true
do
    # On récupère la taille de la liste.
    # Cela permet de savoir si on doit continuer ou s’arrêter.
    nb=$(redis-cli --raw LLEN listproject2)

    if [ $nb -gt 0 ]
    then
        # On dépile un élément.
        # RPOP est cohérent avec LPUSH côté producer.
        value=$(redis-cli --raw RPOP listproject2)

        # Si la valeur dépasse le seuil, on simule un traitement plus long.
        if [ $value -gt $threshold ]
        then
            sleep $delay_process
        fi

    else
        # Ici, contrairement au test-local-1, on QUITTE le consumer.
        # C’est volontaire : cela permet au script run.sh de lancer
        # des consumers supplémentaires uniquement quand nécessaire.
        exit 0
    fi
done
