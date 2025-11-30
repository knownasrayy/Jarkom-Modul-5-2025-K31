auto lo
iface lo inet loopback

# Ke Atas (Moria)
auto eth0
iface eth0 inet static
    address 10.79.10.18
    netmask 255.255.255.252
    gateway 10.79.10.17
    dns-nameservers 8.8.8.8

# Ke Kiri (Durin)
auto eth1
iface eth1 inet static
    address 10.79.1.129
    netmask 255.255.255.192

# Ke Kanan (Khamul)
auto eth2
iface eth2 inet static
    address 10.79.2.1
    netmask 255.255.255.248