#!/bin/sh

set -e

DUMPNAME=$(date +%Y%m%d%H%M).sql.gz

if [ "$FTP_URL" = "**None**" ]; then
  return
else
  cd /backup/
  gzip dump.sql
  mv dump.sql.gz "$DUMPNAME"
  curl -T "$DUMPNAME" -u "$FTP_USER":"$FTP_PASSWORD" "$FTP_URL"
  rm -f "$DUMPNAME"
fi