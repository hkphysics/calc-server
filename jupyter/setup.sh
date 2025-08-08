#!/bin/bash
set -e
sudo apt install python3 python3-dev git curl
sudo apt install npm
sudo -E python3  ./bootstrap.py --admin admin
sudo tljh-config set http.port 3002
sudo tljh-config reload



