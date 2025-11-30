auto lo
iface lo inet loopback

# --- INTERNET (ETH0) ---
auto eth0
iface eth0 inet static
    address 192.168.0.100
    netmask 255.255.255.0
    gateway 192.168.0.2
    dns-nameservers 8.8.8.8

# --- LOKAL ---
# Ke Bawah (Rivendell)
auto eth1
iface eth1 inet static
    address 10.79.10.9
    netmask 255.255.255.252

# Ke Kiri (Moria)
auto eth2
iface eth2 inet static
    address 10.79.10.5
    netmask 255.255.255.252

# Ke Kanan (Minastir)
auto eth3
iface eth3 inet static
    address 10.79.10.13
    netmask 255.255.255.252

# --- ROUTING (Peta Jalan ke Cucu) ---
# Arah Moria
up ip route add 10.79.2.16/29 via 10.79.10.6
up ip route add 10.79.1.128/26 via 10.79.10.6
up ip route add 10.79.2.0/29 via 10.79.10.6

# Arah Rivendell
up ip route add 10.79.2.8/29 via 10.79.10.10

# Arah Minastir
up ip route add 10.79.0.0/24 via 10.79.10.14
up ip route add 10.79.1.192/26 via 10.79.10.14
up ip route add 10.79.2.24/29 via 10.79.10.14
up ip route add 10.79.1.0/25 via 10.79.10.14
up ip route add 10.79.10.24/30 via 10.79.10.14
up ip route add 10.79.10.28/30 via 10.79.10.14

# --- NAT ---
up iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.0.100