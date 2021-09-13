#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/five.rasi"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
			loginctl poweroff
        ;;
    $reboot)
			loginctl reboot
        ;;
    $lock)
			slock
        ;;
    $suspend)
			pamixer -m
			loginctl suspend
        ;;
    $logout)
				bspc quit
        ;;
esac
