#!/bin/bash
set -e

tar -xf dvdrental.tar
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE dvdrental;
EOSQL
pg_restore -U "$POSTGRES_USER" -d dvdrental dvdrental
