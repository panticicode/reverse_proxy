#!/bin/bash
cd /var/www/html/reverse-proxy && docker compose down
cd /var/www/html/cockpitts && JZW=1000 docker compose down
cd /var/www/html/suite-main && docker compose down
cd /var/www/html/suite-dev && docker compose down
cd /var/www/html/suite-demo && docker compose down