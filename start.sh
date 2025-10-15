#!/bin/bash
set -e

echo "===> Starting suite-main..."
cd /var/www/html/suite-main && docker compose up -d

echo "===> Starting suite-dev..."
cd /var/www/html/suite-dev && docker compose up -d

echo "===> Starting suite-demo..."
cd /var/www/html/suite-demo && docker compose up -d

echo "===> Starting cockpitts..."
cd /var/www/html/cockpitts && JZW=1000 docker compose up -d

echo "===> Starting reverse-proxy..."
cd /var/www/html/reverse-proxy && docker compose up -d
