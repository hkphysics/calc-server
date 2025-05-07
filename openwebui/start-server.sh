#!/bin/bash

while true;
do
    ssh joe@dev1.hkphysics.hk -N -L 172.17.0.1:11434:localhost:11434
done
