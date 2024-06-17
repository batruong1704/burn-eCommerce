#!/bin/bash

# Set permissions recursively to 777 for the 'devilbox' directory

composer install

sudo bin/magento setup:install \
--base-url=https://staing.burnecommerce.site/ \
--db-host=localhost \
--db-name=staging \
--db-user=root \
--db-password=admin \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--search-engine=elasticsearch7 \
--elasticsearch-host=localhost \
--elasticsearch-port=9200 \
--elasticsearch-index-prefix=magento2 \
--elasticsearch-timeout=15 


sudo chmod -R 777 /var/www/html/burning/htdocs
sudo chown -R www-data:www-data /var/www/html/burning/htdocs

sudo php -d memory_limit=-1 bin/magento setup:upgrade
sudo chmod -R 777 /var/www/html/burning/htdocs
sudo chown -R www-data:www-data /var/www/html/burning/htdocs
sudo php -d memory_limit=-1 bin/magento setup:di:compile
sudo chmod -R 777 /var/www/html/burning/htdocs
sudo chown -R www-data:www-data /var/www/html/burning/htdocs
sudo php -d memory_limit=-1 bin/magento setup:static-content:deploy -f
sudo chmod -R 777 /var/www/html/burning/htdocs
sudo chown -R www-data:www-data /var/www/html/burning/htdocs

php -d memory_limit=-1 bin/magento index:reindex
sudo chmod -R 777 /var/www/html/burning/htdocs
sudo chown -R www-data:www-data /var/www/html/burning/htdocs
