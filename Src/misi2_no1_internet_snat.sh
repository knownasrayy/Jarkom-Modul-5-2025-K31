#!/bin/bash
# SOAL: Misi 2 No 1 - SNAT (No Masquerade)
# LOKASI: Osgiliath

# GANTI IP INI SESUAI IP PUBLIC YANG DIDAPAT OSGILIATH
IP_PUBLIC="192.168.0.100" 

iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $IP_PUBLIC

echo "SNAT Configured using IP: $IP_PUBLIC"