#!/bin/bash

docker run --name "postgresql-dev-db" \
  -v $(pwd)/postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER="postgres" \
  -e POSTGRES_PASSWORD="postgres" \
  -p 5432:5432 \
  -d postgres:10
