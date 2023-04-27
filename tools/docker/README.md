## Запуск локального сервера через докер

#### 1. Установить докер (https://docs.docker.com/engine/install/)
- unix: docker + docker-compose (e.x ubuntu https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04, https://docs.docker.com/engine/install/ubuntu/)
- windows: docker desktop (https://docs.docker.com/desktop/install/windows-install/)

#### 2. Скопировать конфиги (необязательно)
- Запустить скрипт `./prepare.sh`, который скопирует конфиги из `config/example` в `config` и подставит конфиг для базы
- Добавить в конфиг `admins.txt` запись со своим ckey, чтобы иметь админку

#### 3. Запустить сервер 
- Запустить скрипт `./recreate.sh`

#### 4. После запуска можно подключаться к серверу [byond://127.0.0.1:1337](byond://127.0.0.1:1337)

## P.S

#### Просмотр логов
- Общие: `station/data/logs`
- Сервера: `docker logs ss220-paradise-app`

#### Проблемы
- Отсутствует подключение к БД: иногда может возникнуть ситуация, когда сервер стартует раньше чем БД, решается перезапуском сервера `./recreate.sh`