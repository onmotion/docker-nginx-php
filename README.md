# docker-nginx-php

Webserver based on nginx + php-fpm stack

## How To Start

### Clone the project

```bash
git clone git@github.com:onmotion/docker-nginx-php.git
cd docker-nginx-php
```

### Config

1. Edit .env file: \
   `PROJECTS_DIR=/Users/a.kozhevnikov/www` - root dir where is your php projects
   `PHP_VERSION` - which php version will be installed

1. Edit (if it necessary) images/php/Dockerfile \
   You can add php modules which will be installed, just add it to section

   `RUN apt-get update && apt-get install -y \`

   For example if you need intl module:
   `php${PHP_VERSION}-intl`

1. Add nginx hosts to `nginx/conf.d`
1. Add `127.0.0.1 your-host.lh` to **hosts** file

### Run

```bash
docker-compose build
docker-compose up -d
```

### Usage

After the container successfully started up, you can access your host `http://your-host.lh:80`

You can access container by `host.docker.internal` alias. So, if you have locally installed _postgres_, you should set up your app as `host.docker.internal:5432` instead of `127.0.0.1:5432`, and add port to **docker-compose.yml** to services - php - ports section

> After each change of config you should do `docker-compose build && docker-compose up -d && docker-compose restart`

### PHP alias

If you want to run **php** from bash, you can add bash alias. For example add `alias php="docker exec -it docker-nginx-php_php_1 php"` to .bashrc or .bash_profile

```bash
echo -e "alias php=\"docker exec -it php php\"" >> ~/.bashrc
source ~/.bashrc
php -v
```

### Debug with PHPStorm and Xdebug

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-32-35.png)

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-34-15.png)

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-35-26.png)

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-36-01.png)

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-45-00.png)

![fluent](https://raw.githubusercontent.com/onmotion/docker-nginx-php/docs/docs/img/2020-10-14_17-48-02.png)
