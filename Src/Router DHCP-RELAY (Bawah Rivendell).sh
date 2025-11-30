auto lo
iface lo inet loopback

# Ke Atas (Rivendell)
auto eth0
iface eth0 inet static
    address 10.79.10.22
    netmask 255.255.255.252
    gateway 10.79.10.21
    dns-nameservers 8.8.8.8

# Ke Bawah (Server Vilya & Narya)
auto eth1
iface eth1 inet static
    address 10.79.2.9
    netmask 255.255.255.248