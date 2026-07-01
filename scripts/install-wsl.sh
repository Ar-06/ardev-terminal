#!/usr/bin/env bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

has_command() {
    command -v "$1" >/dev/null 2>&1
}

install_apt_package() {
    local package="$1"

    if ! dpkg -s "$package" >/dev/null 2>&1; then
        echo "[INFO] Installing $package..."
        sudo apt install -y "$package"
    else
        echo "[ OK ] $package already installed"
    fi
}

echo ""
echo "=========================================="
echo "        ArDev Terminal WSL Installer"
echo "=========================================="
echo ""

echo "[INFO] Updating package lists..."
sudo apt update

echo ""
echo "[INFO] Checking required tools..."

if ! has_command starship; then
    echo "[INFO] Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "[ OK ] Starship already installed"
fi

if ! has_command fastfetch; then
    echo "[INFO] Installing Fastfetch..."
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
    sudo apt update
    sudo apt install -y fastfetch
else
    echo "[ OK ] Fastfetch already installed"
fi

install_apt_package git
install_apt_package curl
install_apt_package unzip
install_apt_package fzf
install_apt_package zoxide
install_apt_package bat
install_apt_package eza

echo ""
echo "[INFO] Installing ArDev configuration..."

mkdir -p "$HOME/.config/fastfetch"

cp "$PROJECT_ROOT/themes/ardev.toml" "$HOME/.config/starship.toml"
cp "$PROJECT_ROOT/config/fastfetch/linux.jsonc" \
   "$HOME/.config/fastfetch/config.jsonc"
cp "$PROJECT_ROOT/config/fastfetch/ardev.txt" "$HOME/.config/fastfetch/ardev.txt"

if [ -f "$HOME/.bashrc" ]; then
    cp "$HOME/.bashrc" "$HOME/.bashrc.ardev.bak"
fi

if ! grep -q "ArDev Terminal - WSL Bash Config" "$HOME/.bashrc"; then
    cat "$PROJECT_ROOT/config/wsl/.bashrc" >> "$HOME/.bashrc"
else
    echo "[ OK ] ArDev Bash config already present"
fi

echo ""
echo "[OK] ArDev Terminal installed for WSL"
echo "Run:"
echo "  source ~/.bashrc"
echo ""