#!/bin/bash


general_tools=(
    stow
    yay
    unzip
    wget
    curl   
)

core_dependencies=(
    alacritty
    hypridle  
    hyprland
    hyprlock
    network-manager-applet
    uwsm
    waybar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
)


sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm "${general_tools[@]}"
sudo pacman -S --noconfirm "${core_dependencies[@]}"