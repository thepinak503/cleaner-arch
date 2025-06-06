#!/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'
echo -e "${CYAN}==== Arch Linux Maintenance Script ====${RESET}"
if ! command -v paccache &> /dev/null; then
    echo -e "${YELLOW}Installing pacman-contrib for cache management...${RESET}"
    sudo pacman -Sy --noconfirm pacman-contrib
else
    echo -e "${GREEN}pacman-contrib is already installed.${RESET}"
fi
echo -e "${CYAN}Enabling paccache.timer for automatic cache cleanup...${RESET}"
sudo systemctl enable --now paccache.timer

# 3. Clean old package cache (keep last 3 versions)
echo -e "${CYAN}Cleaning old package cache (keeping last 3 versions)...${RESET}"
sudo paccache -r
echo -e "${CYAN}Removing orphaned packages...${RESET}"
orphans=$(pacman -Qtdq)
if [ -n "$orphans" ]; then
    sudo pacman -Rs --noconfirm $orphans
    echo -e "${GREEN}Orphaned packages removed.${RESET}"
else
    echo -e "${YELLOW}No orphaned packages found.${RESET}"
fi
echo -e "${CYAN}Cleaning user cache in ~/.cache/...${RESET}"
rm -rf ~/.cache/*
echo -e "${GREEN}User cache cleaned.${RESET}"

# 6. Vacuum systemd journal logs (keep only 100M)
echo -e "${CYAN}Vacuuming systemd journal logs (keeping 100M)...${RESET}"
sudo journalctl --vacuum-size=100M

echo -e "${GREEN}==== Maintenance Complete! ====${RESET}"
echo -e "${YELLOW}Tip: Your system will now auto-clean the package cache weekly via systemd timer.${RESET}"
