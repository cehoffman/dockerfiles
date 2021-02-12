FROM centos/postgresql-12-centos7

ENV POSTGRESQL_DATABASE pdns
ENV POSTGRESQL_USER pdns

COPY postgres.conf /opt/app-root/src/postgresql-cfg/
COPY init.sh /opt/app-root/src/postgresql-start/
COPY schema.pgsql.sql /opt/app-root/src/postgresql-start/
