auto lo
iface lo inet loopback

# Ke Atas (Osgiliath)
auto eth0
iface eth0 inet static
    address 10.79.10.10
    netmask 255.255.255.252
    gateway 10.79.10.9
    dns-nameservers 8.8.8.8

# Ke Bawah (DHCP Relay Router)
auto eth1
iface eth1 inet static
    address 10.79.10.21
    netmask 255.255.255.252

# Routing ke Server Vilya/Narya
up ip route add 10.79.2.8/29 via 10.79.10.22