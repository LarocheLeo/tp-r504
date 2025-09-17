#!/bin/bash

docker run -d \
  -p 5000:5000 \
  --name tp4-app \
  --network net-tp4 \
  --mount type=bind,source="/home/fi25-laroc/tp-r504/TP4/srv/",dst="/srv/" \
  im-tp4




