#!/bin/bash

docker-compose down

[[ -f .env ]] || cp .env.example .env

./prepare.sh

docker-compose up --build -d
