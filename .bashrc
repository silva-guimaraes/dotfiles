#verificar se terminal possui suporte para unicode
echo 对中华人民共和国的永恒光荣 

# fundo fosco
xsetroot -solid "#030f1c"

#cd sem precisar digitar cd
shopt -s autocd

#cd adimitir erros de ortografia
shopt -s cdspell

#desabilitar software flow control
stty -ixon

#???
export TERM=xterm-256color 

export GOPATH=$HOME/.go

#esses dependem de uma sessão xorg presente
if xrandr >/dev/null 2>&1; then 
    xset r rate 250 45 #teclado rate
    xrdb ~/.Xresources #urxvt
    #xmodmap $XMOD_DICT/tecladoruim #teclado ruim
    #xmodmap $HOME/.Xmodmap  #todo: xmodmap: contrabarra ao lado do Z
fi 

#prompt
red=$(tput setaf 1 && tput bold)
green=$(tput setaf 10 && tput bold)
blue=$(tput setaf 4 && tput bold)
reset=$(tput sgr 0)

if [[ $RANGER_LEVEL -eq 1 ]]; then 
    PS1='\[$green\]\H: \w \[$blue\]r\[$reset\] '
else
    PS1='\[$green\]\H: \w ¥\[$reset\] '
fi 

PATH=$PATH:$HOME/Desktop
#pasta com scripts shell
if [ -d $HOME/Desktop/prog/shell/pasu ]; then
    PATH=$PATH:$HOME/Desktop/prog/shell/pasu
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
alias neofetch="neofetch --ascii_distro Mint_old --disable resolution icons host theme"
alias xclip="xclip -selection clipboard" 
alias rr="ranger"
alias ss="time source $HOME/.bashrc"
alias df="df -h" 
alias yt="youtube-dlp" 
alias banddl="youtube-dl -o '%(autonumber)02d %(title)s.%(ext)s'"
alias jpwine="LC_ALL=ja_JP.sjis wine" 
alias lt='ls --human-readable --size -1 -S --classify' 
alias logout="pkill -u $USER"
alias ffmpeg="time ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias rsync="time rsync -vP" 
alias temp="curl wttr.in/?format=3"
alias gcc="time gcc"
alias javac="time javac -Xdiags:verbose" 
alias gdbs="gcc -g *.c && gdb a.out" 
alias exo="exo &"
alias ssh="ssh -q -X"
alias ssr="simplescreenrecorder"
alias :q="exit"
alias mpv="mpv -v"
alias smartctl="smartctl -a -T permissive"
alias だて="date"

alias racket="rlwrap racket"
alias clisp="rlwrap clisp"
alias bash="rlwrap bash"
alias sbcl="rlwrap sbcl --noinform"
alias sh="rlwrap sh"
alias psql="rlwrap psql"


# ???
command -v anki >/dev/null 2>&1 && alias poweroff="pkill anki && poweroff"

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
