#!/bin/sh

# Sportify
#xdotool key Super_L+6 # Change to Screen 6
#spotify &
#sleep 1
#xdotool key Super_L+1 # Switch Back to home screen

# Dropbox
#~/.dropbox-dist/dropboxd &

# Wallpaper
feh --bg-fill --no-fehgb --randomize  $XDG_CONFIG_HOME/X11/wallpapers/* &

# source ~/.dotfiles/nnn/nnn_profile.sh

# Dwmblocks
dwmblocks &
