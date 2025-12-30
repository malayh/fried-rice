#!/usr/bin/env bash


dir="$HOME/.config/rofi/powermenu"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=' Power off'
reboot=' Reboot'
lock=' Lock'
yes=''
no='󰜺'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/theme.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/theme.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$reboot\n$shutdown" | rofi_cmd
}


closehyperlandwindows() {
	# close all open windows
	hyprctl clients -j | \
	jq -r ".[].address" | \
	xargs -I{} hyprctl dispatch closewindow address:{}
	hyprctl dispatch workspace 1
}


poweroff() {
    # close all open windows
    hyprctl clients -j | \
    jq -r ".[].address" | \
    xargs -I{} hyprctl dispatch closewindow address:{}

    # Move to first workspace
    hyprctl dispatch workspace 1
    systemctl poweroff --no-wall
}

lockscreen() {
	pidof hyprlock || hyprlock &
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
            poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--lock' ]]; then
			lockscreen
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		run_cmd --lock
        ;;
esac