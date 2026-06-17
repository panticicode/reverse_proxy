#!/bin/bash
set -e

echo "===> Starting isleblue..."
cd /var/www/html/isleblue/isleblue && docker compose up -d
echo "===> Starting stmartin..."
cd /var/www/html/isleblue/stmartinblue && docker compose up -d
echo "===> Starting stbartsblue..."
cd /var/www/html/isleblue/stbartsblue && docker compose up -d
echo "===> Starting barbadosblue..."
cd /var/www/html/isleblue/barbadosblue && docker compose up -d
echo "===> Starting api.isleblue..."
cd /var/www/html/isleblue/api.isleblue && docker compose up -d
echo "===> Starting manageisleblue..."
cd /var/www/html/isleblue/manage.isleblue && docker compose up -d
echo "===> Starting reverse-proxy..."
cd /var/www/html/isleblue/reverse-proxy && docker network connect backend isleblue_mysql && docker compose up -d 
