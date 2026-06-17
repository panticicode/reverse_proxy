#!/bin/bash
cd /var/www/html/isleblue/reverse-proxy && docker compose down
cd /var/www/html/isleblue/isleblue && docker compose down
cd /var/www/html/isleblue/stmartinblue && docker compose down
cd /var/www/html/isleblue/stbartsblue && docker compose down
cd /var/www/html/isleblue/barbadosblue && docker compose down
cd /var/www/html/isleblue/api.isleblue && docker compose down
cd /var/www/html/isleblue/manage.isleblue && docker compose down