#!/bin/bash
set -e

cd /var/www/html/isleblue/reverse-proxy & docker network connect backend isleblue_mysql