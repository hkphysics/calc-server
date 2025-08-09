#!/bin/bash

HOST="${HOST:-joe@dev1.hkphysics.hk}"

autossh -M 0 $HOST -N -o "StrictHostKeyChecking no" -L 0.0.0.0:11434:localhost:11434 -L 0.0.0.0:2525:localhost:25 &


