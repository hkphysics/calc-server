#!/bin/bash
docker exec -it twenty-db-1 pg_dumpall -U postgres >  crm-$(date +"%Y%m%d%H%M%S" -u).sql

