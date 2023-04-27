#!/bin/bash

./stop_db.sh

[[ -f .env ]] || cp .env.example .env

docker-compose -f docker-compose.db.yml up --build -d
