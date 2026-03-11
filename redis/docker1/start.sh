#!/bin/bash

echo "=== Nettoyage des anciens conteneurs ==="
docker stop $(docker ps -q) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

echo "=== Création du réseau myredis ==="
docker network create myredis 2>/dev/null

echo "=== Construction des images ==="
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .

echo "=== Démarrage du serveur Redis ==="
docker run -d \
    --network myredis \
    --name s_redis \
    redis:latest

echo "=== Démarrage du consumer ==="
docker run -d \
    --network myredis \
    --name s_cons \
    img_cons

echo "=== Démarrage du producer ==="
docker run -d \
    --network myredis \
    --name s_prod \
    img_prod

echo "=== Tout est lancé ! ==="
echo "Utiliser pour plus d'information : docker logs -f s_cons"
