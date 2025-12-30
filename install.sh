#!/bin/bash


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

    # asus rog/tuf specific
    asusctl
)


_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0
        return #true
    fi
    echo 1
    return #false
}

_installPackages() {
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed."
            continue
        fi
        yay --noconfirm -S "${pkg}"
    done
}



sudo yay -Syu --noconfirm
_installPackages "${general_tools[@]}"
_installPackages "${core_dependencies[@]}"