#!/bin/bash

if [ "$#" -eq 0 ]; then
    services="mariadb node nginx vue-node vue-laravel laravel"
else
    services="$@"
fi

docker compose down --remove-orphans
docker compose up -d --build $services
