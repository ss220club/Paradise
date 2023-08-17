#!/bin/bash

./stop_db.sh

[[ -f .env ]] || cp .env.example .env
cp dbconfig.db.txt ../../config/dbconfig.txt

docker-compose -f docker-compose.db.yml up --build -d
