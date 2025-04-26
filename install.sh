#!/usr/bin/env bash

# ======================================================
#      Script de Instalação de Ambientes Gráficos
#                 por Franklin Souza
#                     @frannksz
# ======================================================

menu_ambientes() {
  clear
  echo "Escolha o ambiente gráfico para instalar:"
  echo "[1] - KDE Plasma (Wayland)"
  echo "[2] - Sway"
  echo "[3] - Hyprland"
  read -rp "Digite a opção desejada [1-3]: " choice

  case "$choice" in
    1) install_plasma ;;
    2) install_sway ;;
    3) install_hyprland ;;
    *) echo "Opção inválida. Tente novamente." && sleep 2 && menu_ambientes ;;
  esac
}

install_plasma() {
  echo -e "\n[+] Instalando KDE Plasma (Wayland)...\n"
  sudo pacman -S plasma-meta \
    plasma-wayland-session \
    sddm \
    sddm-kcm \
    wayland \
    xorg-xwayland \
    kitty \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    pavucontrol \
    base-devel \
    usbutils \
    xf86-video-amdgpu \
    xdg-desktop-portal-kde --noconfirm

  sudo systemctl enable sddm
}

install_sway() {
  echo -e "\n[+] Instalando Sway...\n"
  sudo pacman -S sway \
    wayland \
    xorg-xwayland \
    xf86-video-amdgpu \
    ttf-dejavu \
    kitty \
    swappy \
    xorg-xrandr \
    waybar \
    pavucontrol \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    xdg-desktop-portal-wlr \
    base-devel \
    polkit-gnome \
    slurp \
    usbutils \
    wl-clipboard --noconfirm
}

install_hyprland() {
  echo -e "\n[+] Instalando Hyprland...\n"
  sudo pacman -S hyprland \
    wayland \
    xorg-xwayland \
    xf86-video-amdgpu \
    ttf-dejavu \
    kitty \
    swappy \
    hyprpicker \
    xorg-xrandr \
    waybar \
    pavucontrol \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    xdg-desktop-portal-hyprland \
    base-devel \
    polkit-gnome \
    hyprpaper \
    slurp \
    usbutils \
    hyprlock \
    wl-clipboard --noconfirm
}

# Executar menu
menu_ambientes
