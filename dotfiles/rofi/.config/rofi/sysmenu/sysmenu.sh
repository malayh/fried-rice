#!/bin/bash

source ~/.config/rofi/common/generic.sh


opt_install="󰏔 Install software"
opt_screenshot="󰄀 Take screenshot"
opt_screenrecord=" Record screen"
main_menu="$opt_install\n$opt_screenshot\n$opt_screenrecord"
chosen=$(_runrofimenu "$main_menu" "System Menu" "󰍹")

case $chosen in
    $opt_install)
        $HOME/.config/rofi/sysmenu/softwareinstall.sh
        ;;
    $opt_screenshot)
        $HOME/.config/rofi/sysmenu/screenshot.sh
        ;;
    $opt_screenrecord)
        echo "Starting screen recording..."
        ;;
esac

