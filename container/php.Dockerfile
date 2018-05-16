FROM php:7.1-fpm

ENV DEBIAN_FRONTEND=noninteractive TERM=linux

RUN apt-get update && apt-get install -y --no-install-recommends\
 git\
 graphicsmagick\
 libcurl4-openssl-dev\
 libfreetype6-dev\
 libgd-dev\
 libjpeg62-turbo-dev\
 libpng-dev\
 libxml2-dev\
 locales\
 openssh-client\
 python\
 python-pip\
 zlib1g-dev\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install unicodecsv

RUN curl https://composer.github.io/installer.sig -s 2>&1 | tr -d '\n' > installer.sig\
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"\
 && php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"\
 && php composer-setup.php --install-dir=/usr/bin/ --filename=composer\
 && php -r "unlink('composer-setup.php'); unlink('installer.sig');"

RUN docker-php-ext-install -j$(nproc) curl gd mysqli opcache xml soap zip\
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/\
 && docker-php-ext-install -j$(nproc) gd

ARG cUID
RUN usermod --non-unique --uid $cUID www-data

ENV LANG=de_DE.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen\
 && sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen\
 && dpkg-reconfigure --frontend=noninteractive locales\
 && update-locale LANG=en_US.UTF-8\
 && update-locale LANG=de_DE.UTF-8

COPY conf/php/typo3.conf /usr/local/etc/php-fpm.d/
RUN mkdir -p /var/www/.composer && chown www-data: /var/www/.composer
VOLUME ["/var/www/.composer"]
VOLUME ["/var/www/vendor"]
