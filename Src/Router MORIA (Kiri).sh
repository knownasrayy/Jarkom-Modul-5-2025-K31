auto lo
iface lo inet loopback

# Ke Atas (Osgiliath)
auto eth0
iface eth0 inet static
    address 10.79.10.6
    netmask 255.255.255.252
    gateway 10.79.10.5
    dns-nameservers 8.8.8.8

# Ke Kiri (Web Server IronHills)
auto eth1
iface eth1 inet static
    address 10.79.2.17
    netmask 255.255.255.248

# Ke Bawah (Wilderland)
auto eth2
iface eth2 inet static
    address 10.79.10.17
    netmask 255.255.255.252

# Routing ke Wilderland
up ip route add 10.79.1.128/26 via 10.79.10.18
up ip route add 10.79.2.0/29 via 10.79.10.18