#!/bin/bash

echo "=== Nettoyage des anciens conteneurs ==="
# On arrête et supprime tous les conteneurs existants pour repartir proprement.
docker stop $(docker ps -q) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

echo "=== Création du réseau myredis ==="
# Réseau Docker dédié pour que les conteneurs puissent communiquer par hostname.
docker network create myredis 2>/dev/null

echo "=== Construction des images ==="
# Construction des images consumer et producer
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .

echo "=== Démarrage du serveur Redis ==="
# Lancement du serveur Redis dans un conteneur séparé
docker run -d \
    --network myredis \
    --name s_redis \
    redis:latest

echo "=== Démarrage du consumer ==="
# Lancement du consumer dans le même réseau
docker run -d \
    --network myredis \
    --name s_cons \
    img_cons

echo "=== Démarrage du producer ==="
# Lancement du producer dans le même réseau
docker run -d \
    --network myredis \
    --name s_prod \
    img_prod

echo "=== Tout est lancé ! ==="
echo "Utiliser pour plus d'information : docker logs -f s_cons"
