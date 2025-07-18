#!/bin/bash

autossh -M 0 joe@dev1.hkphysics.hk -N -o "StrictHostKeyChecking no" -L 172.17.0.1:11434:localhost:11434 &
autossh -M 0 joe@dev1.hkphysics.hk -N -o "StrictHostKeyChecking no" -L localhost:11434:localhost:11434 &

