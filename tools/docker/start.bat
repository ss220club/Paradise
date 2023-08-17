@echo off

call stop.bat

echo F|xcopy  ".env.example" ".env" /d

call prepare_configs.bat

docker-compose "-f" "docker-compose.server.yml" "up" "--build" "-d"
