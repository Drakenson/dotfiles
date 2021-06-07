#!/bin/bash
rsync -av --stats --del --exclude 'database' ~/.config/settheme.sh ~/.config/gettheme.sh ~/.config/gammastep ~/.config/sway ~/.config/imv ~/.config/waybar ~/.config/wofi ~/.config/mpd ~/.config/alacritty pc_wayland/.config
rsync -av --stats --del --exclude '.netrwhist' ~/.ncmpcpp ~/.vim ~/.vimrc ~/.zshrc pc_wayland
