FROM php:7.2.16-cli-stretch

## update apt-get
RUN apt-get clean
RUN apt-get update

## install git composer
RUN apt-get -y install git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## install sqlite3 for some tests
RUN apt-get -y install sqlite3

## install library for php extension
RUN apt-get -y install apt-utils
RUN apt-get -y install libicu-dev
RUN apt-get -y install libxslt1-dev
RUN apt-get -y install $PHPIZE_DEPS
RUN apt-get -y install zip unzip

## install php extension
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install xsl

## install xdebug and enable xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
