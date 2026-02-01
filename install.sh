#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# force IPv4
echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4

# disable mobian repo (expired key)
rm -f /etc/apt/sources.list.d/mobian.list /etc/apt/trusted.gpg.d/mobian.gpg || true

# update & deps
apt update -y
apt install -y ca-certificates curl docker.io docker-compose

# enable docker
systemctl enable docker
systemctl start docker

# download & run instal.sh directly
cd /opt
rm -rf honeyil
mkdir honeyil
cd honeyil

curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/honeyil/main/instal.sh -o instal.sh
chmod +x instal.sh
./instal.sh
