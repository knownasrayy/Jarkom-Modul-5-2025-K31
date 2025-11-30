#!/bin/bash
# NAMA: Config DHCP Relay
# LOKASI: Router Minastir, AnduinBanks, Wilderland, Pelargir

# Pastikan internet jalan dulu di router ini
echo "=== INSTALL RELAY ==="
apt-get update
apt-get install isc-dhcp-relay -y

# Konfigurasi Manual via Text Editor (Karena interfacenya beda-beda tiap router)
# Edit file /etc/default/isc-dhcp-relay
# SERVERS="10.79.2.10"
# INTERFACES="eth0 eth1 eth2" (Sesuaikan dengan interface router)

echo "Silakan edit manual /etc/default/isc-dhcp-relay lalu restart service"
# service isc-dhcp-relay restart