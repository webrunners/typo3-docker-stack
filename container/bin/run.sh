#!/usr/bin/env bash
set -eu

cd "$(dirname "$0")/../"

export cUID=$UID

set -x
COMPOSE_PROJECT_NAME=t3stack COMPOSE_FILE=docker-compose.yml exec docker-compose ${@:-up -d}
