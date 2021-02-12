#!/bin/sh

set -e

if [[ ! -f /var/lib/pgsql/data/.initialized ]]; then
  cat /opt/app-root/src/postgresql-start/schema.pgsql.sql | psql -U "${POSTGRESQL_USER}" "${POSTGRESQL_DATABASE}"
  touch /var/lib/pgsql/data/.initialized
fi
