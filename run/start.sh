#!/bin/bash
set -xe
/usr/bin/supervisord
tail -F /var/log/supervisor/*.log /var/log/nginx/*.log
