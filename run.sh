#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  exit
else
  exec go-cron "$SCHEDULE" /bin/sh backup.sh
fi