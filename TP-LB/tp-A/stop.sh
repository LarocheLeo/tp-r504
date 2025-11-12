#!/bin/bash
#stop les dockers actifs et vu que chaque docker a -rm. il seront supprimer.
docker stop $(docker ps)
#supprime le réseau 
docker network rm tplb
