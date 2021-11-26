FROM mysql:8

ARG SCRIPT_DIR=/scripts

WORKDIR ${SCRIPT_DIR}

ENV MYSQL_USER=root MYSQL_PASSWORD=changeit MYSQL_HOST=localhost SCRIPT_DIR=/scripts

CMD mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} < ${SCRIPT_DIR}/main.sql || exit 1
