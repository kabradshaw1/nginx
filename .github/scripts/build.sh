#!/bin/bash
set -xe

  cd ../..

  docker-compose down

  git pull origin main

  docker-compose up -d --build