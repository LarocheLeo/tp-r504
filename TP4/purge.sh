#!/bin/bash

docker kill $(docker ps)
docker system prune
docker volume prune

