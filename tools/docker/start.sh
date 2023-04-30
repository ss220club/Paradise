#!/bin/bash

./stop.sh

[[ -f .env ]] || cp .env.example .env

./prepare_configs.sh

docker-compose -f docker-compose.server.yml up --build -d
