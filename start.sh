#!/usr/bin/env bash

# set -x

OLD_PATH=$(pwd)
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function finish {
  cd $OLD_PATH
}
trap finish EXIT

err_exit() {
  echo "$@" 1>&2
  exit 1
}

echo "cd $SCRIPT_PATH ..."
cd $SCRIPT_PATH || err_exit "Failed to cd $SCRIPT_PATH"

echo "docker-compose start ..."
docker-compose start || err_exit "Failed to start docker-compose"

wait

echo "docker-compose exec builder bash ..."
docker-compose exec builder bash || err_exit "Failed to exec bash"

wait

echo "docker-compose stop -t 0 ..."
docker-compose stop -t 0 || err_exit "Failed to stop docker-compose"

exit 0
