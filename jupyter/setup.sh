#!/bin/bash
set -e
sudo apt install python3 python3-dev git curl
sudo apt install npm
sudo npm install -g ganache-cli
sudo -E python3  ./bootstrap.py --admin admin



