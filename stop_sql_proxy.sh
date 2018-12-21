#!/bin/sh
source ~/.docker_run_scripts/environment.sh

docker stop $(echo $CLOUD_SQL_INSTANCE_NAME | sed 's/:/./g')-socket
docker stop $(echo $CLOUD_SQL_INSTANCE_NAME | sed 's/:/./g')-tcp