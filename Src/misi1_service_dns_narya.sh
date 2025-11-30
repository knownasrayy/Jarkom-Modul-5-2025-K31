#!/bin/bash
# NAMA: Config DNS Server
# LOKASI: NARYA

echo "=== INSTALL BIND9 ==="
apt-get update
apt-get install bind9 -y

# (Config Zone DNS dilakukan manual sesuai kebutuhan soal jika ada domain spesifik)
# Untuk saat ini install saja sudah cukup memenuhi syarat identifikasi perangkat.
service bind9 start