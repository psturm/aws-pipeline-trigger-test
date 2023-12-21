#!/bin/bash
# Small script to:
# * start an empty postgres database
# * execute all migrations, preloading and seeding
# * create snapshot of postgres database including data
# * push image(s) to registry

set -eu

image_name="testdb"
tag="$(date +%s)"
image="${image_name}:${tag}"


echo "## Ensure previous data is removed .."
docker compose -f docker-compose.yml down

echo "## Trigger build .."
docker compose -f docker-compose.yml build

echo "## Starting database and executing migrations .."
docker compose -f docker-compose.yml up \
    --abort-on-container-exit \
    --exit-code-from db-init

echo "## Creating image snapshot .."
docker commit testdb ${image}

# also tag as "latest"
docker tag ${image} ${image_name}:latest


docker image ls | grep ${image_name}

echo "## Pushing to registry .."
echo "@TODO: docker push ${image}"
echo "@TODO: docker push ${image_name}:latest"
