# docker-nginx-php
docker-nginx-php

## How To Start

### Clone the project

```bash
git clone git@github.com:onmotion/docker-nginx-php.git
cd docker-nginx-php
```

### Config

1. Edit .env file:
  
  `PROJECTS_DIR=/Users/a.kozhevnikov/www` - root dir where is your php projects 
  `PHP_VERSION` - which php version will be installed

2. Edit (if it necessary) images/php/Dockerfile

    You can add php modules which will be installed, just add it to section
    
    `RUN apt-get update && apt-get install -y \`
    
    For example if you need intl module:
    `php${PHP_VERSION}-intl`

3. Add nginx hosts to `nginx/conf.d`
   
4. Add `127.0.0.1 your-host.lh` to **hosts** file

### Run

```bash
docker-compose build
docker-compose up -d
```

### Usage

After the container successfully started up, you can access your host `http://your-host.lh:80`

You can access container by `host.docker.internal` alias. So, if you have locally installed *postgres*, you should set up your app as `host.docker.internal:5432` instead of `127.0.0.1:5432`, and add port to **docker-compose.yml** to services - php - ports section

> After each change of config you should do `docker-compose up -d && docker-compose restart`