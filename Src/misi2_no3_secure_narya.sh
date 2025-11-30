#!/bin/bash
# SOAL: Misi 2 No 3 - Secure Narya
# LOKASI: Narya

IP_VILYA="10.79.2.10"

# Allow Vilya
iptables -A INPUT -p udp --dport 53 -s $IP_VILYA -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -s $IP_VILYA -j ACCEPT

# Block Others
iptables -A INPUT -p udp --dport 53 -j DROP
iptables -A INPUT -p tcp --dport 53 -j DROP

echo "Narya DNS Access Restricted to Vilya Only"