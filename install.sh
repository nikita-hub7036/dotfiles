#!/bin/bash

set -e

echo "===== Arch Linux Dotfiles Installer ====="

# -----------------------
# 1. Install configs
# -----------------------
echo "[+] Installing configs..."
mkdir -p ~/.config
cp -r .config/* ~/.config/
echo "===== Configurations successfully installed ====="

# -----------------------
# 2. Install packages
# -----------------------
PACKAGES=$(grep -Ev '^\s*$|^\s*#' pacman.txt)
sudo pacman -Sy --needed --noconfirm $PACKAGES
echo "===== Packages successfully installed ====="

# -----------------------
# 3. Install fonts
# -----------------------
echo "[+] Installing fonts..."
mkdir -p ~/.local/share/fonts
cp -r fonts/* ~/.local/share/fonts/
echo "[+] Updating font cache..."
fc-cache -f
echo "===== Fonts successfully installed ====="

echo "===== Installation Complete ====="
