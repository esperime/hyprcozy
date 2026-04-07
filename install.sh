#!/bin/bash

clear

cat << EOF
This will overwrite your existing configurations.

EOF

read -p "Proceed to installation? [y/n]: " proceed

if [ "$proceed" = 'y' ]; then

	# Set up an AUR helper
	if ! command -v paru >/dev/null 2>&1; then
		sudo pacman -S --needed base-devel
		git clone https://aur.archlinux.org/paru.git
		cd paru
		makepkg -si
	fi

	# Install necessary packages
	sudo pacman -S fastfetch waybar fuzzel mako thunar adwaita-fonts thunar-archive-plugin alacritty hyprshot firefox
	paru -S matugen-bin sunsetr-bin python-pywalfox awww-bin

	# Transfer configs
	SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
	cp -r "$SCRIPT_DIR/.config/." ~/.config/

	read -p "Include .bashrc? [y/n]: " bashrc
	read -p "Include .vimrc? [y/n]: " vimrc

	if [ "$bashrc" = 'y' ]; then
		cp -i .bashrc ~/
	fi

	if [ "$vimrc" = 'y' ]; then
		cp -i .vimrc ~/
	fi

	# Initialize matugen
	matugen image images/frieren_camp.png

	cat << 'EOF' 
	Post-installation instructions:
	1. Reboot your system.
	2. If you are using Firefox, add Pywalfox extension and run `pywalfox update` afterwards.

EOF
else 
	echo "Exiting..."
fi
