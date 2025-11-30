#!/bin/bash
# SOAL: Misi 2 No 8 - Redirect Sihir Hitam
# LOKASI: Router DHCP-Relay (Bawah Rivendell)

IP_VILYA="10.79.2.10"
NET_KHAMUL="10.79.2.0/29"
IP_IRONHILLS="10.79.2.18"

iptables -t nat -A PREROUTING -s $IP_VILYA -d $NET_KHAMUL -j DNAT --to-destination $IP_IRONHILLS

echo "Redirect Rule Applied"