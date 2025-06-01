#!/bin/bash
set -e
sudo apt install python3 python3-dev git curl
sudo apt install npm
sudo -E python3  ./bootstrap.py --admin admin

# use anvil for backend
# https://github.com/idrees535/Uniswap-V3-Simulator/issues/1

#https://medium.com/@natelapinski/run-your-own-ethereum-testnet-using-anvil-and-python-7e18c93a4315

curl -L https://foundry.paradigm.xyz | bash
~/.foundry/bin/foundryup
pip install jupyter-ai[all]



