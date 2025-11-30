auto lo
iface lo inet loopback

# Ke Atas (Osgiliath)
auto eth0
iface eth0 inet static
    address 10.79.10.14
    netmask 255.255.255.252
    gateway 10.79.10.13
    dns-nameservers 8.8.8.8

# Ke Bawah (Elendil)
auto eth1
iface eth1 inet static
    address 10.79.0.1
    netmask 255.255.255.0

# Ke Kanan (Pelargir)
auto eth2
iface eth2 inet static
    address 10.79.10.25
    netmask 255.255.255.252

# Routing ke anak-anak Pelargir
up ip route add 10.79.1.192/26 via 10.79.10.26
up ip route add 10.79.2.24/29 via 10.79.10.26
up ip route add 10.79.1.0/25 via 10.79.10.26
up ip route add 10.79.10.28/30 via 10.79.10.26