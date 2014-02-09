#!/bin/bash

set -ex

if [ -f /ssl/server.crt ] && [ -f /ssl/server.key ];
then
  sed -i "s/PHABRICATOR_CONTAINER/http:\/\/$PHAB_PORT_80_TCP_ADDR:$PHAB_PORT_80_TCP_PORT/" /etc/nginx/sites-available/ssl
else
  sed -i "s/PHABRICATOR_CONTAINER/http:\/\/$PHAB_PORT_80_TCP_ADDR:$PHAB_PORT_80_TCP_PORT/" /etc/nginx/sites-available/default
fi

/usr/bin/supervisord

# adapted from: http://stackoverflow.com/a/20932423/1050649
while ( true )
  do
  echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
  sleep 1
  /bin/bash
done

