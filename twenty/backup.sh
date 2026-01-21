#!/bin/bash
docker exec -it twenty-db-1 pg_dumpall -U postgres 
