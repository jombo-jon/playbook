# Autostart X using startx after tty login.
#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VNTR -eq 1 ]]; then
#	exec startx
#fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	export XDG_CONFIG_HOME=$HOME/.config
	export XDG_DATA_HOME=$HOME/.data
	exec startx
fi


