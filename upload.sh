#!/bin/sh

set -e

if [ "$FTP_URL" = "**None**" ]; then
  return
else
  cd /backup/
  gzip dump.sql
  curl -T dump.sql.gz -u "$FTP_USER":"$FTP_PASSWORD" "$FTP_URL"
  rm -f dump.sql.gz
fi