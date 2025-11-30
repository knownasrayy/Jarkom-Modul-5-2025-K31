#!/bin/bash
# SOAL: Misi 3 - Isolasi Khamul
# LOKASI: Router Wilderland

NET_KHAMUL="10.79.2.0/29"

# Blokir Keluar dari Khamul
iptables -A FORWARD -s $NET_KHAMUL -j DROP

# Blokir Masuk ke Khamul
iptables -A FORWARD -d $NET_KHAMUL -j DROP

echo "Khamul has been Isolated!"