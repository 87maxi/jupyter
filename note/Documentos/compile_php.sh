#!/bin/bash

##########################
######## debian ##########
##########################


apt-get install gcc  pkg-config libxml2-dev  libssl-dev libsqlite3-dev zlib1g-dev libcurl4-openssl-dev libwebp-dev libbz2-dev libpng-dev libjpeg-dev libfreetype6-dev libgmp-dev build-essential libxpm-dev libonig-dev libpq-dev libpspell-dev libreadline-dev libtidy-dev libxslt1-dev libzip-dev libmariadb-dev default-libmysqlclient-dev g++ -y ;

#####################
# instalacion de php#
#####################
PHP_VERSION="8.2.0"
wget https://www.php.net/distributions/php-${PHP_VERSION}.tar.gz;
tar xzvf php-${PHP_VERSION}.tar.gz;


    echo $PHP_VERSION;
    cd php-${PHP_VERSION} &&
    ./configure CC=/usr/bin/gcc  \
    --enable-phpdbg \
    --enable-fpm \
    --enable-pdo
    --with-pdo-mysql=mysqlnd \
    --with-mysqli=mysqlnd \
    --with-pgsql \
    --with-pdo-pgsql \
    --with-pdo-sqlite \
    --enable-intl \
    --without-pear \
    --enable-gd \
    --with-jpeg \
    --with-webp \
    --with-freetype \
    --with-xpm \
    --enable-exif \
    --with-zip \
    --with-zlib \
    --with-zlib-dir=/usr \
    --enable-soap \
    --enable-xmlreader \
    --with-xsl \
    --with-tidy \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-shmop \
    --enable-pcntl \
    --with-readline \
    --enable-mbstring \
    --with-curl \
    --with-gettext \
    --enable-sockets \
    --with-bz2 \
    --with-openssl \
    --with-gmp \
    --enable-bcmath \
    --enable-calendar \
    --enable-ftp \
    --with-pspell=/usr; 
    --with-enchant=/usr \
    --with-kerberos \
    --enable-sysvmsg \
    --with-ffi \
    --with-sodium \
    --enable-zend-test=shared \
    --enable-dl-test=shared \
    --enable-werror \
    --with-libxml \
    --with-pear 

 make ;
 make install;
 #make test;

cp  php-${PHP_VERSION}/php.ini-production /usr/local/lib/php.ini;

cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf;
 
