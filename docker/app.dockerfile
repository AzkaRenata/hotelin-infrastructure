FROM shakyshane/laravel-php:latest
COPY composer.lock composer.json /var/www/
COPY database /var/www/database
WORKDIR /var/www
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && php composer.phar install --no-dev --no-scripts \
 && rm composer.phar
COPY . /var/www
RUN chown -R www-data:www-data \
 /var/www/storage \
 /var/www/bootstrap/cache
RUN php artisan optimize