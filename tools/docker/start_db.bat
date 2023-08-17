@echo off

call stop_db.bat

echo F|xcopy ".env.example" ".env" /d
echo F|xcopy "dbconfig.db.txt" "%CD%\..\..\config\dbconfig.txt" /y

docker-compose "-f" "docker-compose.db.yml" "up" "--build" "-d"
