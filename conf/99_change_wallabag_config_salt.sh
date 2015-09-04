#!/bin/bash
set -e
SALT='0833238ebf45fed19179415644fda3d6'

if [ -e /var/www/wallabag/write/config.inc.php ] ; then
  if [ -f /etc/container_environment/WALLABAG_SALT ] ; then
      SALT=`cat /etc/container_environment/WALLABAG_SALT`
  fi
  sed -i "s/'SALT', '.*'/'SALT', '$SALT'/" /var/www/wallabag/write/config.inc.php
fi
