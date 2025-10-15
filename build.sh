#!/bin/bash
cd /var/www/html/suite-main && docker compose build
cd /var/www/html/suite-dev && docker compose build
cd /var/www/html/suite-demo && docker compose build
cd /var/www/html/cockpitts && JZW=1000 docker compose build
cd /var/www/html/reverse-proxy && docker compose build