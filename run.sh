#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  exit
else
  echo "$POSTGRES_PASSWORD" > /root/.pgpass &&
  chmod 0600 /root/.pgpass && \
  echo "$SCHEDULE /backup.sh" > /crontab.txt && \
  /usr/bin/crontab /crontab.txt && \
  exec /usr/sbin/crond -f -l 8
fi