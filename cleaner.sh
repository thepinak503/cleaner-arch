#!/bin/bash

# Arch Linux Maintenance Script
# Run as root for full functionality

echo "==== Arch Linux Maintenance Script ===="

# 1. Clean pacman cache (keep last 3 versions)
echo "Cleaning old package cache (keeping last 3 versions)..."
if ! command -v paccache &> /dev/null; then
    echo "paccache not found, installing pacman-contrib..."
    sudo pacman -Sy --noconfirm pacman-contrib
fi
sudo paccache -r

# 2. Optionally, remove ALL cached packages (uncomment to enable)
echo "Removing all cached packages..."
sudo pacman -Scc

# 3. Remove orphaned packages
echo "Removing orphaned packages..."
orphans=$(pacman -Qtdq)
if [ -n "$orphans" ]; then
    sudo pacman -Rs --noconfirm $orphans
else
    echo "No orphaned packages found."
fi

# 4. Clean user cache
echo "Cleaning user cache in ~/.cache/ ..."
rm -rf ~/.cache/*

# 5. Vacuum systemd journal logs (keep only 100M)
echo "Vacuuming systemd journal logs (keeping 100M)..."
sudo journalctl --vacuum-size=100M

# 6. (Optional) Update system (uncomment to enable)
echo "Updating system..."
sudo pacman -Syu

echo "==== Maintenance Complete ===="
