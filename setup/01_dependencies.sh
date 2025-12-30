#!/bin/bash


system_dependencies=(
    stow   
)


setup_dependencies=(
    hyprland
    alacritty
)

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm "${system_dependencies[@]}"
sudo pacman -S --noconfirm "${setup_dependencies[@]}"