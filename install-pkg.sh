#!/bin/bash
apt-get install emacs git caddy autossh

if [ -f /etc/debian_version ]; then
    debver=$(< /etc/debian_version)
    echo "Running on Debian (version $debver)"
# Add Docker's official GPG key:
    apt update
    apt install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
    tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    apt install docker.io docker-compose docker-buildx
fi
