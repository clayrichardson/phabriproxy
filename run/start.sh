#!/bin/bash

set -ex

if [ -f /ssl/server.crt ] && [ -f /ssl/server.key ];
then
  sed -i "s/PHABRICATOR_CONTAINER/http:\/\/$PHAB_PORT_80_TCP_ADDR:$PHAB_PORT_80_TCP_PORT/" /etc/nginx/sites-available/ssl
else
  sed -i "s/PHABRICATOR_CONTAINER/http:\/\/$PHAB_PORT_80_TCP_ADDR:$PHAB_PORT_80_TCP_PORT/" /etc/nginx/sites-available/default
fi

/usr/bin/supervisord

tail -F /var/log/supervisor/*.log /var/log/nginx/*.log

