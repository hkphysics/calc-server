#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

if ! [ -f "etc/default/calc-server" ] ; then
    "please generate etc/default/calc-server"
    exit 1
fi

cp etc/default/calc-server /etc/default
apt-get install caddy autossh
cp caddy/Caddyfile /etc/caddy

cp etc/systemd/system/autossh.service /etc/systemd/system

systemctl daemon-reload
systemctl enable caddy
systemctl enable autossh

wget https://github.com/typst/typst/releases/download/v0.12.0/typst-x86_64-unknown-linux-musl.tar.xz
tar xf typst-x86_64-unknown-linux-musl.tar.xz
rm -f typst*.xz
mv typst-x86_64-unknown-linux-musl/typst /usr/bin
chmod a+x /usr/bin/typst
rm -rf  typst-x86_64-unknown-linux-musl
