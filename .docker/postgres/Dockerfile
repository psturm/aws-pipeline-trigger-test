FROM postgres:11.16

# Setting PGDATA to a path which is NOT a volume, so it'll be included in a
# snapshot of the container later.
# This won't work for local dev environments, as the PGDATA is not
# persistet in a volume, but works well for CI tests
RUN mkdir -p /var/lib/postgresql-static/data
ENV PGDATA /var/lib/postgresql-static/data

COPY ./db-is-ready.sh /usr/local/bin/db-is-ready
COPY ./docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
