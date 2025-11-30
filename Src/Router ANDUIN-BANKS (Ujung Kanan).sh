auto lo
iface lo inet loopback

# Ke Kiri (Pelargir)
auto eth0
iface eth0 inet static
    address 10.79.10.30
    netmask 255.255.255.252
    gateway 10.79.10.29
    dns-nameservers 8.8.8.8

# Ke Bawah (Gilgalad & Cirdan)
auto eth1
iface eth1 inet static
    address 10.79.1.1
    netmask 255.255.255.128