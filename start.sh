#!/bin/bash
set -e

echo "===> Starting isleblue..."
cd /var/www/html/isleblue/isleblue && docker compose up -d
echo "===> Starting isleblue.api..."
cd /var/www/html/isleblue/api.isleblue && docker compose up -d
echo "===> Starting isleblue.manage..."
cd /var/www/html/isleblue/manage.isleblue && docker compose up -d
echo "===> Starting reverse-proxy..."
cd /var/www/html/isleblue/reverse-proxy && docker network connect backend isleblue_mysql && docker compose up -d 
