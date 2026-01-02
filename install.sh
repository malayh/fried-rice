#!/bin/bash

source ./_lib.sh

general_tools=(
    stow
    unzip
    wget
    curl
    jq
)

core_dependencies=(
    alacritty
    btop
    fzf

    # window/session manager for wayland
    uwsm
    
    # hyperland and related packages
    hypridle  
    hyprland
    hyprlock
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-terminal-exec
    waybar
    rofi-wayland
    swaybg
    mako

    # clipboard manager
    cliphist
    wtype

    # storing passwords and auth
    gnome-keyring
    libsecret
    polkit-gnome
    
    # network, bluetooth
    impala                        
    network-manager-applet
    bluetui

    # audio
    wiremix
    pamixer

    # fonts
    ttf-jetbrains-mono-nerd
    ttf-cascadia-mono-nerd

    # theme
    bibata-cursor-theme
    nwg-look

    # asus rog/tuf specific
    asusctl
    rog-control-center 

    # screenshot
    slurp
    grim
    wayfreeze
    satty
    # gpu-screen-recorder

    # monitor control
    ddcutil
    
)

user_apps=(
    # docker and stuff
    docker
    docker-compose
    flatpak
    just
)

sudo yay -Syu --noconfirm
_installPackages "${general_tools[@]}"
_installPackages "${core_dependencies[@]}"
_installPackages "${user_apps[@]}"

./_extra_installs.sh