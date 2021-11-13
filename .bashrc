#urxvt
xrdb ~/.Xresources

#prompt
red=$(tput setaf 1 && tput bold)
reset=$(tput sgr 0)

#cd sem precisar digitar cd
shopt -s autocd

#cd adimitir erros de ortografia
shopt -s cdspell

#pfetch iniciar da sessão
#pfetch
echo 中华人民共和国永远的光荣

#desabilitar software flow control
stty stop ""

#???
export TERM=xterm-256color 

#teclado
xset r rate 250 45
# xmodmap $HOME/.Xmodmap
# xmodmap $HOME/desktop/prog/xmod/tecladoruim


PS1='\[$red\][ \u@\H \A] \W ¥\[$reset\] '

PATH=$PATH:$HOME/desktop/prog/shell
PATH=$PATH:$HOME/repos/publico/apache-maven-3.8.3/bin


#aliases, shortcuts
alias rm="rm -I"
alias cp="cp -r"
alias la="ls -a"
alias acs="apt-cache search"
alias sp="sudo apt"
alias neofetch="neofetch --disable gpu resolution icons host theme"
alias xclip="xclip -selection clipboard" 
alias rr="ranger"
alias fonte="source $HOME/.bashrc"
alias df="df -h" 
alias yt="youtube-dl" 
alias banddl="youtube-dl -o '%(autonumber)02d %(title)s.%(ext)s'"
alias jpwine="LANG=ja_JP.sjis wine" 
alias lt='ls --human-readable --size -1 -S --classify' 
alias logout="pkill -u $USER"
alias gdbs="gcc -g *.c && gdb a.out" 
alias poweroff="pkill anki && poweroff"

# alias gcc="time gcc -Wall -Wextra -Werror -Wpedantic"
alias javac="time javac -Xdiags:verbose"
alias du="du -h -s"
alias exo="exo &"
alias ssh="ssh -v"
alias rsync="time rsync -v"


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
