#!/bin/sh

ENV=$1

echo 'ENV: 'ENV

cd /var/www/html/



echo '------------------------'
echo '--- composer install ---'
echo '------------------------'

rm -rf var;
composer install;

echo '------------------------'
echo '----- chmod & chown ----'
echo '------------------------'

chown -R www-data storage
chown -R www-data bootstrap/cache
chown -R www-data tmp
chmod -R 775 storage
chmod -R 775 bootstrap/cache
chmod -R 775 -R tmp/log

echo '-------------------'
echo '--- clear cache ---'
echo '-------------------'

composer clearcache

echo '-------------------'
echo '----- artisan -----'
echo '-------------------'

php artisan key:generate;