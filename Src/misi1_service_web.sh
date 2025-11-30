#!/bin/bash
# NAMA: Config Web Server
# LOKASI: IronHills & Palantir

HOSTNAME=$(hostname)

echo "=== INSTALL APACHE ==="
apt-get update
apt-get install apache2 -y

echo "=== CREATE INDEX.HTML ==="
echo "Welcome to $HOSTNAME" > /var/www/html/index.html

service apache2 start