#!/bin/sh

set -e

DUMPNAME=$(date +%Y%m%d%H%M).sql.gz

cd /backup/
rm dump.sql.gz
gzip dump.sql
mv dump.sql.gz "$DUMPNAME"
rclone copy "$DUMPNAME" "$RCLONE_DEST"
rm -f "$DUMPNAME"