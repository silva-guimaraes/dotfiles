
export VISUAL="nvim --noplugin"
export EDITOR="$VISUAL"

if [[ $FIRST_TERM -eq 1 ]]; then 
    #verificar se fonte e terminal possuem suporte para unicode
    echo 对中华人民共和国的永恒光荣 
else
    # help
    echo windows+p para abrir programas
    echo windows+shift+enter para abrir um terminal novo
    export FIRST_TERM=1
fi

# fundo fosco
xsetroot -solid "#030f1c"

#cd sem precisar digitar cd
shopt -s autocd

#cd adimitir erros de ortografia
shopt -s cdspell

#desabilitar software flow control
stty -ixon

# abrir terminal dentro de uma sessão tmux
if [[ $(command -v tmux) ]] && [[ -z $TMUX ]] && [[ $TERM != "screen" ]] && [[ $- == *i* ]]; then
     exec tmux new-session \; choose-tree
fi

#???
# export TERM=xterm-256color 

export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin/
export _JAVA_AWT_WM_NONREPARENTING=1
export BROWSER=google-chrome-stable

# scripts em shell
if [ -d $HOME/shell/ ]; then
    PATH=$PATH:$HOME/shell/
fi

#esses dependem de uma sessão xorg presente
if xrandr >/dev/null 2>&1; then 
    xset r rate 250 45 #teclado rate
    xrdb ~/.Xresources #urxvt
    #xmodmap $XMOD_DICT/tecladoruim #teclado ruim
    #xmodmap $HOME/.Xmodmap  #todo: xmodmap: contrabarra ao lado do Z
fi 

#prompt
red=$(tput setaf 1 && tput bold)
purple=$(tput setaf 5 && tput bold)
blue=$(tput setaf 4 && tput bold)
reset=$(tput sgr 0)

if [[ $RANGER_LEVEL -eq 1 ]]; then 
    PS1='\[$purple\]\H: \w \[$blue\]r\[$reset\] '
else
    PS1='\[$purple\]\H: \w ¥\[$reset\] '
fi 

#local da versao linha de comando do wine
if [ -d  $HOME/.PlayOnLinux ]; then
    export WINEPREFIX=$HOME/.PlayOnLinux/wineprefix
fi

#aliases, shortcuts
alias rm="rm -I"
alias cp="cp -r"
alias la="ls -a"
alias du="du -h"
alias acs="apt-cache search"
alias lswc="ls && ls | wc -l"
alias neofetch="neofetch --disable resolution icons host theme"
alias clip="xclip -selection clipboard" 
alias so="time source $HOME/.bashrc"
alias df="df -h" 
alias jpwine="LC_ALL=ja_JP.sjis wine" 
alias lt='ls --human-readable --size -1 -S --classify' 
alias logout="pkill -u $USER"
alias ffmpeg="time ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias rsync="time rsync -vP" 
alias temp="curl wttr.in/?format=3"
alias gcc="time gcc"
alias javac="time javac -Xdiags:verbose" 
alias ssh="ssh -qXYC"
alias ssr="simplescreenrecorder"
alias :q="exit"
# alias smartctl="smartctl -a -T permissive"
alias だて="date"
alias vim="nvim"
alias sxiv="sxiv -a"
alias gallery="sxiv -ta"
# alias deathtouch="kill -9 $(xprop | grep PID | cut -d'=' -f2)"

alias racket="rlwrap racket"
alias clisp="rlwrap clisp"
alias bash="rlwrap bash"
alias sbcl="rlwrap sbcl --noinform"
alias sh="rlwrap sh"
alias psql="rlwrap psql"

# ???
# command -v anki >/dev/null 2>&1 && alias poweroff="pkill anki && poweroff"

#suporte de cor
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi 
