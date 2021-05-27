#!/bin/bash
rsync -av --stats --del --exclude 'database' ~/.config/redshift ~/.config/i3 ~/.config/feh ~/.config/polybar ~/.config/rofi ~/.config/mpd ~/.config/picom.conf ~/.config/alacritty pc/.config
rsync -av --stats --del --exclude '.netrwhist' ~/.ncmpcpp ~/.vim ~/.vimrc ~/.zshrc pc
