#!/bin/bash

# Seuil d’alarme : si une valeur dépilée dépasse ce seuil,
# on considère que c’est un événement anormal (simulation d’un capteur, par ex.)
threshold=30000

# Temps d’attente en cas d’alarme : permet de simuler un traitement plus long
delay_process=4

# Temps d’attente lorsque la liste est vide : évite de tourner en boucle inutilement
empty_wait=2         # attente si liste vide

# Test de connexion à Redis.
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis !"
	exit 1
fi


# Boucle infinie : le consumer tourne en continu pour traiter les données
while true 
do
	# On récupère la taille de la liste.
    # --raw permet d’obtenir uniquement la valeur, sans formatage.
	nb=$(redis-cli --raw LLEN listproject)
	# Si la liste contient au moins un élément, on dépile
    if [ $nb -gt 0 ]
    then
        # RPOP dépile par la droite : choix volontaire pour être cohérent
        # avec un LPUSH côté producteur (FIFO inversée).
        value=$(redis-cli --raw RPOP listproject)

        echo "Valeur dépilée : $value"
        # Si la valeur dépasse le seuil, on déclenche une alarme.
        # Cela simule un traitement conditionnel (ex : dépassement de température).
        # Test du seuil
        if [ $value -gt $threshold ]
        then
            echo "ALARME ! Valeur = $value"
            # Pause volontaire pour simuler un traitement plus long
            sleep $delay_process
        fi

    else
        # Si la liste est vide, on évite de spammer Redis
        echo "Liste vide, attente 2s."
        sleep 2
    fi
done

