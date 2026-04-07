#!/bin/bash

init_system = ps -p 1 -o comm=
system = ""

if [[ "$init_system" == "dinit" ]]; then
	system = "dinitctl"
elif [[ "$init_system" == "systemd" ]]; then
	system = "systemctl"
fi

# Options 
options="Poweroff\nReboot\nLock\nExit"

# Show menu using fuzzel
choice=$(echo -e "$options" | fuzzel -d -p "Logout Menu" -i)

# Execute the selected option
case "$choice" in
    Reboot)
        sudo $system reboot
        ;;
    Poweroff)
        sudo $system poweroff
        ;;
    Suspend)
        sudo $system suspend
        ;;
    Lock)
        hyprlock
        ;;
esac
