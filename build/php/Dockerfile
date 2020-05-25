FROM php:7.4-fpm-alpine

RUN mkdir /run/php

ADD conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

WORKDIR /var/www/html/symfony

EXPOSE 9000

CMD ["php-fpm7.4"]