#!/bin/bash
pushd  openapi-servers/servers/time
uvicorn main:app --host 0.0.0.0 --reload --port 8000 &
popd

pushd  openapi-servers/servers/weather
uvicorn main:app --host 0.0.0.0 --reload --port 8001 &
popd

sleep infinity
