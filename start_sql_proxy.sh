#!/bin/sh
source ~/.docker_run_scripts/environment.sh

docker run -d --rm --name $(echo $CLOUD_SQL_INSTANCE_NAME | sed 's/:/./g')-socket \
    -v /tmp/cloudsql:/cloudsql \
    -v $(echo $CLOUD_SQL_INSTANCE_CREDENTIALS_PATH):/credentials.json \
    gcr.io/cloudsql-docker/gce-proxy:latest /cloud_sql_proxy -dir=/cloudsql -instances=$(echo $CLOUD_SQL_INSTANCE_NAME) -credential_file=/credentials.json

docker run -d --rm --name $(echo $CLOUD_SQL_INSTANCE_NAME | sed 's/:/./g')-tcp \
    -v /tmp/cloudsql:/cloudsql \
    -v $(echo $CLOUD_SQL_INSTANCE_CREDENTIALS_PATH):/credentials.json \
    -p 127.0.0.1:3306:3306 gcr.io/cloudsql-docker/gce-proxy:latest \
    /cloud_sql_proxy -instances=$(echo $CLOUD_SQL_INSTANCE_NAME)=tcp:0.0.0.0:3306 -credential_file=/credentials.json