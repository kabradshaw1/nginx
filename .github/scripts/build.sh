#!/bin/bash
set -xe
  cd nginx

  docker-compose down

  git pull origin main

  docker image prune -a

  docker-compose up -d --build