#!/bin/bash
apt-get install caddy autossh
cp caddy/Caddyfile /etc/caddy
cp openwebui/autossh.service /etc/systemd/system

systemctl daemon-reload
systemctl enable caddy
systemctl enable autossh
