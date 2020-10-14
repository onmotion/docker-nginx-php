FROM debian:buster
ARG PHP_VERSION

# RUN выполняет идущую за ней команду в контексте нашего образа.
# В данном случае мы установим некоторые зависимости и модули PHP.
# Для установки модулей используем команду docker-php-ext-install.
# На каждый RUN создается новый слой в образе, поэтому рекомендуется объединять команды.
RUN apt-get update && apt-get install -y \
        curl \
        git \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libonig-dev \
        libxml2-dev \
        libzip-dev

RUN apt-get -y install lsb-release apt-transport-https ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get install -y \
 php${PHP_VERSION} \
 php${PHP_VERSION}-fpm \
 php${PHP_VERSION}-mysql \
 php${PHP_VERSION}-pgsql \
 php${PHP_VERSION}-xdebug \
 php${PHP_VERSION}-intl \
 php${PHP_VERSION}-ldap

COPY ./fpm/pool.d/ /etc/php/${PHP_VERSION}/fpm/pool.d
# Добавим свой php.ini, можем в нем определять свои значения конфига
COPY ./fpm/conf.d/additional-php.ini /etc/php/${PHP_VERSION}/fpm/conf.d/99-additional-php.ini
COPY ./cli/conf.d/additional-cli-php.ini /etc/php/${PHP_VERSION}/cli/conf.d/99-additional-cli-php.ini

# composer.
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Указываем рабочую директорию для PHP
WORKDIR /var/www

# Запускаем контейнер
CMD /bin/bash service php${PHP_VERSION}-fpm start && /bin/bash