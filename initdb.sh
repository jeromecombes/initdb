#!/bin/sh

#mysql -u root --password=[password] -e "create database planningbiblio_tests"
mysql -u root --password=[password] planningbiblio < plb_symfony_20.04_clean.sql
#mysql -u root --password=[password] planningbiblio < plb_symfony_21.04.sql
mysql -u root --password=[password] planningbiblio -e "update config set valeur='http://planno' where nom='URL';"
php /var/www/planningbiblio/public/index.php
php /var/www/planningbiblio/public/setup/updatedatabase.php
rm -r /var/www/planningbiblio/var/cache/dev
