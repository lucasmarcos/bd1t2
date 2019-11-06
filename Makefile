PGCTL ?= ${HOME}/postgresql/bin/pg_ctl
PSQL ?= ${HOME}/postgresql/bin/psql
DBPATH ?= ./db
DBNAME ?= bd1t2
SOCKET ?= /tmp/postgres

.PHONY: db start stop create_db

db:
	${PGCTL} -D ${DBPATH} initdb

start: db
	mkdir -p /tmp/postgres
	${PGCTL} -o "-k ${SOCKET}" -D ${DBPATH} start

stop:
	${PGCTL} -o "-k ${SOCKET}" -D ${DBPATH} stop

create_db: start
	echo "CREATE DATABASE ${DBNAME};" | ${PSQL} -h ${SOCKET} postgres

script_cria: scriptCria.sql
	${PSQL} -h ${SOCKET} ${DBNAME} -f $<

script_insere: scriptInsere.sql
	${PSQL} -h ${SOCKET} ${DBNAME} -f $<

script_consulta: scriptConsulta.sql
	${PSQL} -h ${SOCKET} ${DBNAME} -f $<

script_atualiza: scriptAtualiza.sql
	${PSQL} -h ${SOCKET} ${DBNAME} -f $<

script_remove: scriptRemove.sql
	${PSQL} -h ${SOCKET} ${DBNAME} -f $<
