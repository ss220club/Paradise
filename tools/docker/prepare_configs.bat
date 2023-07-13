@echo off

echo D|xcopy "%CD%\..\..\config\example\*" "%CD%\..\..\config" /d
echo F|xcopy "dbconfig.txt" "../../config/dbconfig.txt" /y

echo F|xcopy "%CD%\..\..\data\mode.txt" "%CD%\station\data\mode.txt" /d
