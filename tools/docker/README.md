## Запуск локального сервера c базой используя докер

### Подготовка

#### Установить докер (https://docs.docker.com/engine/install/)
- unix: docker + docker-compose (e.g ubuntu https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04, https://docs.docker.com/engine/install/ubuntu/)
- windows: docker desktop (https://docs.docker.com/desktop/install/windows-install/)

### Сервер + БД

#### 1. Скопировать конфиги (необязательно)
- Запустить скрипт `./prepare_configs`, который скопирует конфиги из `config/example` в `config` и подставит конфиг для базы
- Добавить в конфиг `admins.txt` запись со своим ckey, чтобы иметь админку

#### 2. Запуск
- Запустить скрипт `./start`

#### 3. После запуска можно подключаться к серверу [byond://127.0.0.1:1337](byond://127.0.0.1:1337)

#### 4. Остановка
- Запустить скрипт `./stop`

## P.S

#### Просмотр логов
- Общие: `station/data/logs`
- Сервера: `docker logs ss220-paradise-app`

#### Проблемы
- Отсутствует подключение к БД: иногда может возникнуть ситуация, когда сервер стартует раньше чем БД, решается перезапуском сервера `./start`

### БД отдельно от сервера

#### Запуск
- Запустить скрипт `./start_db`

#### Остановка
- Запустить скрипт `./stop_db`