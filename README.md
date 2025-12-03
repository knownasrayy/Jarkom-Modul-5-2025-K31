# Jarkom Modul 4 - VLSM Network Configuration
## Kelompok K31

| Nama                        | NRP        |
| --------------------------- | ---------- |
| Shinta Alya Ramadani        | 5027241016 |
| Rayhan Agnan Kusuma	        | 5027241102 |


### Informasi Jaringan
* **Base IP:** `10.79.0.0/16`
* **Gateway Internet (GNS3):** `192.168.0.2`
* **Metode:** VLSM & CIDR, Static Routing, Iptables Firewall.

---

## Prolog: Pengkhianatan di Dagorlad
Perang Aliansi Terakhir (*The Last Alliance*) sedang berkecamuk. Tugas utama kami adalah membangun infrastruktur jaringan Aliansi yang aman, menghubungkan pasukan Elf dan Manusia, serta mengisolasi pengkhianat **Khamûl** sebelum ia membocorkan strategi perang ke Mordor.

---

## I. Topologi & Perencanaan Jaringan

### 1. Topologi GNS3
<img width="1378" height="776" alt="image" src="https://github.com/user-attachments/assets/77ee5704-b5d0-4e4a-901f-bb23fc976525" />

### 2. Tree Diagram (VLSM)
<img width="565" height="587" alt="image" src="https://github.com/user-attachments/assets/75cca7fb-a127-4a89-97a9-32bb5ae12673" />

### 3. Pembagian IP (VLSM)
Kami menggunakan teknik **VLSM (Variable Length Subnet Mask)** untuk mengalokasikan IP seefisien mungkin berdasarkan kebutuhan host terbesar ke terkecil.

| Subnet | Label (Device) | Kebutuhan | Network ID | Netmask | Range IP | Prefix |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **A1** | Elendil | 200 | 10.79.0.0 | 255.255.255.0 | 10.79.0.1 - 10.79.0.254 | /24 |
| **A2** | Gilgalad | 120 | 10.79.1.0 | 255.255.255.128 | 10.79.1.1 - 10.79.1.126 | /25 |
| **A3** | Durin | 50 | 10.79.1.128 | 255.255.255.192 | 10.79.1.129 - 10.79.1.190 | /26 |
| **A4** | Isildur | 30 | 10.79.1.192 | 255.255.255.192 | 10.79.1.193 - 10.79.1.254 | /26 |
| **A5** | Khamul | 5 | 10.79.2.0 | 255.255.255.248 | 10.79.2.1 - 10.79.2.6 | /29 |
| **A6** | Server Vilya/Narya | 2 | 10.79.2.8 | 255.255.255.248 | 10.79.2.9 - 10.79.2.14 | /29 |
| **A7** | Web IronHills | 1 | 10.79.2.16 | 255.255.255.248 | 10.79.2.17 - 10.79.2.22 | /29 |
| **A8** | Web Palantir | 1 | 10.79.2.24 | 255.255.255.248 | 10.79.2.25 - 10.79.2.30 | /29 |
| **A9-A16**| Backbone Router | 2 (x8) | 10.79.10.x | 255.255.255.252 | (Point-to-Point) | /30 |

### 4. Penggabungan Route (CIDR)
Untuk efisiensi routing, kami melakukan supernetting:
* **Client Block:** `10.79.0.0/23` (Menggabungkan Elendil, Gilgalad, Durin, Isildur).
* **Server Block:** `10.79.2.0/27` (Menggabungkan semua Server & Client Khamul).
* **Router Block:** `10.79.10.0/27` (Menggabungkan semua link antar router).

---

## II. Konfigurasi & Scripting (Misi 1)

Seluruh konfigurasi router dan server dilakukan menggunakan **Shell Script (.sh)** yang dieksekusi di `/root`.

### Daftar Script Konfigurasi
* **[osgiliath.sh](osgiliath.sh)**: Mengatur NAT, Static IP Internet, dan Routing Pusat.
* **[vilya_server.sh](vilya_server.sh)**: Konfigurasi DHCP Server dengan alokasi subnetting VLSM.
* **[narya_dns.sh](narya_dns.sh)**: Konfigurasi Bind9 DNS Server.
* **[webservers.sh](webservers.sh)**: Script setup Apache untuk IronHills & Palantir.
* **Router Cabang (Moria, Minastir, dll)**: Mengatur IP statis dan DHCP Relay.

### Cara Menjalankan
1.  Salin script ke node yang sesuai.
2.  Berikan permission execute: `chmod +x nama_script.sh`
3.  Jalankan: `./nama_script.sh`

---

## III. Security Rules (Misi 2)

Implementasi Firewall menggunakan `iptables` untuk mengamankan jaringan.

### 1. Koneksi Internet (SNAT)
Menggunakan **SNAT** (bukan Masquerade) pada Router Osgiliath agar jaringan lokal dapat mengakses internet.
```bash
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.0.100
