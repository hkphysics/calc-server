#!/bin/bash
set -e
sudo apt install python3 python3-dev git curl
sudo apt install npm
sudo -E python3  ./bootstrap.py --admin admin
pip install jupyter-ai[all]



