#!/bin/sh

pg_dump --create --file=\\dump.sql --format=c --dbname="$POSTGRES_DATABASE" --username="$POSTGRES_USER" --host="$POSTGRES_HOST" --port="$POSTGRES_PORT" -v