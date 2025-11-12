#!/bin/bash

#Créer un reseau interne Docker nommé tplb

docker network create tplb

#(b) Construire l’image basée sur le Dockerfile ci-dessus en la nommant im-nginx-lb

docker build --tag im-nginx-lb .

#(c) Créer deux sous-dossiers shared1 et shared2

mkdir -p shared1 shared2

#(d) Y placer deux fichiers index.html contenant une ligne :
#<h1>Hello 1</h1> et <h1>Hello 2</h1>

echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

#(e) Lancer deux conteneurs basé sur l’image nginx, qui seront nommés nginx1 et nginx2, et fonctionnant en mode "detached". Ces deux conteneurs vont "mapper" le port 80 sur, respectivement, les ports 81 et 82. Ils devront également mettre en place un "bind-mount", qui va mapper les sous dossiers shared1 et shared2 sur les dossiers /usr/share/nginx/html de chaque conteneur. Ajouter l’option --rm afin que les deux conteneurs soient automatiquement supprimés lors de leur arrêt.

docker run -d --rm \
	--name nginx1 \
	--network tplb \
	-p 81:80 \
	--mount type=bind,src=$(pwd)/shared1,dst=/usr/share/nginx/html \
	nginx


docker run -d --rm \
	--name nginx2 \
	--network tplb \
	-p 82:80 \
	--mount type=bind,src=$(pwd)/shared2,dst=/usr/share/nginx/html \
	nginx

#f) Lancer un conteneur basé sur l’image im-nginx-lb, qui va mapper le port 80 du conteneur sur le port 83.

docker run -d --rm \
	--name nginx-lb \
	--network tplb \
	-p 83:80 \
	im-nginx-lb

