#!/bin/bash

docker-compose down

[[ -f .env ]] || cp .env.example .env

./prepare_configs.sh

docker-compose up --build -d
