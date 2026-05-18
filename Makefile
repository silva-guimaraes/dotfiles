.PHONY: *
XDG_CONFIG = ${HOME}/.config

false:
	false

neovim: ${XDG_CONFIG}
	ln -s ${PWD}/neovim ${XDG_CONFIG}/nvim

yazi: ${XDG_CONFIG}
	ln -s ${PWD}/yazi ${XDG_CONFIG}/yazi

mpv: ${XDG_CONFIG}
	ln -s ${PWD}/mpv ${XDG_CONFIG}/mpv

zshrc:
	ln -s ${PWD}/zshrc/zshrc ~/.zshrc

xmodmap:
	ln -s ${PWD}/xmodmap/Xmodmap ~/.Xmodmap

tmux:
	ln -s ${PWD}/tmux/tmux.conf ~/.tmux.conf

${XDG_CONFIG}:
	mkdir -p ${XDG_CONFIG}

