#!/bin/bash
# Setup Chaotic-AUR on the host system (needed to build Sith OS with Calamares)
set -e

echo "Setting up Chaotic-AUR repository..."

# Import key
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

# Install keyring and mirrorlist
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo ""
echo "Chaotic-AUR is ready. You can now run: sudo ./build.sh"
