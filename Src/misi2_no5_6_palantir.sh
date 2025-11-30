#!/bin/bash
# SOAL: Misi 2 No 5 & 6 - Palantir Rules
# LOKASI: Palantir

# --- No 6: Anti Port Scan ---
iptables -N PORTSCAN
iptables -A INPUT -p tcp --syn -j PORTSCAN
iptables -A PORTSCAN -m recent --name portscan --update --seconds 20 --hitcount 15 -j LOG --log-prefix "PORT_SCAN_DETECTED: "
iptables -A PORTSCAN -m recent --name portscan --update --seconds 20 --hitcount 15 -j DROP
iptables -A PORTSCAN -m recent --name portscan --set -j RETURN

# --- No 5: Jam & Ras ---
# Elf (07.00 - 15.00)
iptables -A INPUT -p tcp --dport 80 -s 10.79.1.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT

# Manusia (17.00 - 23.00)
iptables -A INPUT -p tcp --dport 80 -s 10.79.0.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.79.1.192/26 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT

# Blokir Sisanya
iptables -A INPUT -p tcp --dport 80 -j DROP

echo "Palantir Security Rules Applied"