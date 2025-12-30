#!/bin/bash


general_tools=(
    stow
    unzip
    wget
    curl   
)

core_dependencies=(
    alacritty
    hypridle  
    hyprland
    hyprlock
    impala
    network-manager-applet
    uwsm
    waybar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
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