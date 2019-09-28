#!/bin/sh

set -e

pg_dump --create --file=/backup/dump.sql --format=c --dbname="$POSTGRES_DATABASE" --username="$POSTGRES_USER" --host="$POSTGRES_HOST" --port="$POSTGRES_PORT" -v
sh /upload.sh
if [ "$CHECK_URL" = "**None**" ]; then
  echo "INFO: Define CHECK_URL with https://healthchecks.io to monitor sync job"
else
  curl "$CHECK_URL"
fi
