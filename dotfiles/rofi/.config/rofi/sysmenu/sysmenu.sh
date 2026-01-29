#!/bin/bash

source ~/.config/rofi/common/generic.sh


opt_install="󰏔 Install software"
opt_screenshot="󰄀 Take screenshot"
opt_screenrecord=" Record screen"
opt_toggle_gpu="󰍹 Toggle GPU mode"
main_menu="$opt_install\n$opt_screenshot\n$opt_screenrecord\n$opt_toggle_gpu"
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
    $opt_toggle_gpu)
        $HOME/.config/rofi/sysmenu/toggle_gpu.sh
        ;;
esac

