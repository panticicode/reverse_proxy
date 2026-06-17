#!/bin/bash
echo "===> Building isleblue..."
cd /var/www/html/isleblue/isleblue && docker compose build 
echo "===> Building stmartinblue..."
cd /var/www/html/isleblue/stmartinblue && docker compose build 
echo "===> Building sbartsblue..."
cd /var/www/html/isleblue/stbartsblue && docker compose build
echo "===> Building barbadosblue..."
cd /var/www/html/isleblue/barbadosblue && docker compose build
echo "===> Building api.isleblue..."
cd /var/www/html/isleblue/api.isleblue && docker compose build 
echo "===> Building manage.isleblue..."
cd /var/www/html/isleblue/manage.isleblue && docker compose build 
echo "===> Building reverse-proxy..."
cd /var/www/html/isleblue/reverse-proxy && docker compose build 