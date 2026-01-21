#!/bin/bash
docker exec -it redmine-db-1 pg_dumpall -U postgres 
