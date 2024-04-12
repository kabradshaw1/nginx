#!/bin/bash
set -xe

  docker-compose down

  git pull origin main

  docker-compose up -d --build

  docker image prune -a -f --filter "until=24h"