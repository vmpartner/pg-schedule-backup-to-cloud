#!/bin/sh

set -e

DUMPNAME=$(date +%Y%m%d%H%M).sql.gz

cd /backup/
gzip dump.sql
mv dump.sql.gz "$DUMPNAME"
rclone copy "$DUMPNAME" "$RCLONE_DEST"
rm -f "$DUMPNAME"