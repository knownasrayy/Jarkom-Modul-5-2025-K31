#!/bin/bash
# SOAL: Misi 2 No 4 & 7 - IronHills Rules
# LOKASI: IronHills

# --- No 7: Limit 3 Koneksi ---
iptables -A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 3 -j REJECT

# --- No 4: Waktu & Faksi ---
# Durin
iptables -A INPUT -p tcp --dport 80 -s 10.79.1.128/26 -m time --weekdays Sat,Sun -j ACCEPT
# Khamul
iptables -A INPUT -p tcp --dport 80 -s 10.79.2.0/29 -m time --weekdays Sat,Sun -j ACCEPT
# Elendil
iptables -A INPUT -p tcp --dport 80 -s 10.79.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT
# Isildur
iptables -A INPUT -p tcp --dport 80 -s 10.79.1.192/26 -m time --weekdays Sat,Sun -j ACCEPT

# Blokir sisa akses web
iptables -A INPUT -p tcp --dport 80 -j DROP

echo "IronHills Time & Faction Rules Applied"