PGCTL ?= ${HOME}/postgresql/bin/pg_ctl
PSQL ?= ${HOME}/postgresql/bin/psql
DBPATH ?= ./db

db:
	${PGCTL} -D ${DBPATH} initdb

start: db
	mkdir -p /tmp/postgres
	${PGCTL} -o "-k /tmp/postgres" -D ${DBPATH} start

stop:
	${PGCTL} -o "-k /tmp/postgres" -D ${DBPATH} stop

create_db:
	echo "CREATE DATABASE bd1t2;" | ${PSQL} -h /tmp/postgres postgres

script_cria:
	${PSQL} -h /tmp/postgres bd1t2 -f scriptCria.sql
