FROM alpine:


RUN apk upgrade
RUN apk add sudo util-linux

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
#RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.12/main >> /etc/apk/repositories

RUN apk add -U shadow

RUN apk add openssl
RUN apk add --no-cache --virtual \
    autoconf \
    bison \
    bzip2 \
    bzip2-dev \
    ca-certificates \
    coreutils \
    dpkg-dev dpkg \
    g++ \
    gcc \
    musl-dev \
    gdbm-dev \
    glib-dev \
    libc-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    make \
    ncurses-dev \
    #openssl \
    openssl-dev \
    #openssl1.1-dev\
    patch \
    procps \
    tar \
    xz \
    yaml-dev \
    zlib-dev \
    binutils\
    zeromq-dev\
    git \
    curl \
    sqlite-dev \
    sqlite\
    ncurses-dev \
    unixodbc-dev \
    build-base \
    libpng-dev \
    #openjdk21 \
    erlang-dev \
    elixir \
    curl-dev\
    enchant \
    libwebp-dev \
    libjpeg \
    libjpeg-turbo-dev \
    libxpm-dev \
    oniguruma-dev \
    freetype-dev \
    gmp-dev \
    icu-dev \
    #icu-data-full \
    postgresql-dev \
    aspell-dev \
    readline-dev \
    tidyhtml-dev \
    libzip-dev \
    libc-dev \
    libgcrypt-dev \
    ;



RUN adduser -D educar

RUN su educar

USER educar
WORKDIR /home/educar

#################### start php #########################################################


ARG PHP_VERSION=8.2.1

RUN wget https://www.php.net/distributions/php-${PHP_VERSION}.tar.gz
RUN mkdir -p ${HOME}/local/php;
RUN tar xzvf php-${PHP_VERSION}.tar.gz;
RUN rm php-${PHP_VERSION}.tar.gz;
RUN cd php-${PHP_VERSION} && \
    #CFLAGS="-Wno-error=stringop-overread -Wno-error=address -Wno-discarded-qualifiers -Wno-error=incompatible-pointer-types -Wno-error=pointer-sign -Wno-deprecated-declarations -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" \
    CFLAGS="-Wno-error=maybe-uninitialized" \
    ./configure CC=/usr/bin/gcc --prefix=${HOME}/local/php\
    --enable-phpdbg \
    --enable-fpm \
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
    --with-pspell=/usr \
    #--with-enchant=/usr \
    #--with-kerberos \
    --enable-sysvmsg \
    --with-ffi \
    --with-sodium \
    --enable-zend-test=shared \
    --enable-dl-test=shared \
    --enable-werror \
    --with-libxml \
    --with-pear && \
    make && \
    make install;


ENV PATH=/home/educar/local/php/bin:${PATH}
