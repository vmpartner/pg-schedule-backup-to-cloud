#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  exit
else
  echo "$POSTGRES_PASSWORD" > /root/.pgpass && chmod 0600 /root/.pgpass
  exec go-cron "$SCHEDULE" /bin/sh backup.sh
fi