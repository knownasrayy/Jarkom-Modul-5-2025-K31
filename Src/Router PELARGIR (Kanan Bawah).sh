auto lo
iface lo inet loopback

# Ke Kiri (Minastir)
auto eth0
iface eth0 inet static
    address 10.79.10.26
    netmask 255.255.255.252
    gateway 10.79.10.25
    dns-nameservers 8.8.8.8

# Ke Kanan (AnduinBanks)
auto eth1
iface eth1 inet static
    address 10.79.10.29
    netmask 255.255.255.252

# Ke Bawah (Isildur)
auto eth2
iface eth2 inet static
    address 10.79.1.193
    netmask 255.255.255.192

# Ke Bawah (Web Server Palantir)
auto eth3
iface eth3 inet static
    address 10.79.2.25
    netmask 255.255.255.248

# Routing ke Gilgalad
up ip route add 10.79.1.0/25 via 10.79.10.30