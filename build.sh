#!/bin/bash
cd /var/www/html/isleblue/isleblue && docker compose build 
echo "===> Building api.isleblue..."
cd /var/www/html/isleblue/api.isleblue && docker compose build 
echo "===> Building manage.isleblue..."
cd /var/www/html/isleblue/manage.isleblue && docker compose build 
echo "===> Building reverse-proxy..."
cd /var/www/html/isleblue/reverse-proxy && docker compose build 