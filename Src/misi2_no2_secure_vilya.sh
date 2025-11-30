#!/bin/bash
# SOAL: Misi 2 No 2 - Secure Vilya
# LOKASI: Vilya

# Drop ICMP Echo Request (Orang lain ping ke Vilya)
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

echo "Vilya Ping Protection Enabled"