#!/bin/bash

# Set permissions recursively to 777 for the 'devilbox' direct

sudo chmod -R 777 /var/www/html/*
sudo chown -R www-data:www-data /var/www/html/*
sudo chmod 750 /var/www/html/htdocs/app/etc/env.php
