#!/bin/bash
# NAMA: Config DHCP Server
# LOKASI: VILYA

echo "=== UPDATE & INSTALL ==="
apt-get update
apt-get install isc-dhcp-server -y

echo "=== CONFIGURING INTERFACE ==="
sed -i 's/INTERFACESv4=""/INTERFACESv4="eth0"/' /etc/default/isc-dhcp-server

echo "=== CONFIGURING SUBNETS ==="
cat > /etc/dhcp/dhcpd.conf << EOL
default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 8.8.8.8;

# Subnet Vilya Sendiri (Wajib)
subnet 10.79.2.8 netmask 255.255.255.248 {}

# Client Elendil
subnet 10.79.0.0 netmask 255.255.255.0 {
    range 10.79.0.2 10.79.0.254;
    option routers 10.79.0.1;
}
# Client Gilgalad & Cirdan
subnet 10.79.1.0 netmask 255.255.255.128 {
    range 10.79.1.2 10.79.1.126;
    option routers 10.79.1.1;
}
# Client Durin
subnet 10.79.1.128 netmask 255.255.255.192 {
    range 10.79.1.130 10.79.1.190;
    option routers 10.79.1.129;
}
# Client Isildur
subnet 10.79.1.192 netmask 255.255.255.192 {
    range 10.79.1.194 10.79.1.254;
    option routers 10.79.1.193;
}
# Client Khamul
subnet 10.79.2.0 netmask 255.255.255.248 {
    range 10.79.2.2 10.79.2.6;
    option routers 10.79.2.1;
}
EOL

echo "=== RESTARTING SERVICE ==="
service isc-dhcp-server restart
service isc-dhcp-server status