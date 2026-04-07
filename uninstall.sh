cat << EOF
This will remove all files inside config/.

EOF

read -p "Proceed to uninstallation? [y/n]: " proceed

if [ "$proceed" = 'y' ]; then

	rm -r ~/.config/*

	read -p "Remove installed packages? [y/n]: " remove

		if [ "$remove" = 'y' ]; then
			sudo pacman -Rns fastfetch waybar fuzzel mako thunar adwaita-fonts thunar-archive-plugin hyprshot firefox
			paru -Rns matugen-bin sunsetr-bin python-pywalfox awww-bin
		fi

	cat << EOF
	Remove/Overwrite these manually:
		- Alacritty
		- .bashrc
		- .vimrc

	Reboot your device.
EOF
else
	echo "Exiting..."
fi
