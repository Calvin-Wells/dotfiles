# If running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
	if [  -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

#Include private bin in path if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# If running interactively on tty1 then start xorg
if [[ ! $DISPLAY && XDG_VTNR -eq 1 ]]; then
	exec startx
fi
