#!/bin/bash
set -e

DOMAIN=lhvm2.centralus.cloudapp.azure.com

#Just pass where the certbot directory is on the server
APP_PATH=$1

docker-compose -f $APP_PATH/certbot/docker-compose.yml up

mkdir -p $APP_PATH/nginx/certs/$DOMAIN

cat $APP_PATH/certbot/conf/live/$DOMAIN/privkey.pem > $APP_PATH/nginx/certs/$DOMAIN/privkey.pem
cat $APP_PATH/certbot/conf/live/$DOMAIN/fullchain.pem > $APP_PATH/nginx/certs/$DOMAIN/fullchain.pem

docker restart nginx
