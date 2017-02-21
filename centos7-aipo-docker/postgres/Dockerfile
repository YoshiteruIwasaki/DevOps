#https://hub.docker.com/_/postgres/
FROM postgres:9.4
MAINTAINER aipo

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD aipo
ENV POSTGRES_DB org001

ADD ./org001.sql /docker-entrypoint-initdb.d/org001.sql