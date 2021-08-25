#cd sem precisar digitar cd
shopt -s autocd
#cd adimitir erros de ortografia
shopt -s cdspell
#pfetch iniciar da sessão
pfetch

export TERM=xterm-256color

#arquivos de configuração
SHELL_FOLDER=/home/xi/Desktop/prog/shell
bash=$HOME/.bashrc
i3=$HOME/.config/i3/config
i3s=$HOME/.config/i3status/config
vimrc=$HOME/.vimrc
windows=$HOME/mount/Users/daani/Desktop
todo=/$HOME/Desktop/todo


#aliases, shortcuts
alias rm="rm -I"
alias cp="cp -r"
alias la="ls -a"
alias acs="apt-cache search"
alias sp="sudo apt"
alias ap="apropos"
alias nfetch="neofetch --disable gpu icons host theme"
alias xclip="xclip -selection clipboard"
alias gcc="time gcc -Wall -Wextra -Werror -Wpedantic"
alias rr="ranger"
alias ss="source $bash"
alias df="df -h"
alias dd="xdg-open"
alias tiananmen="$SHELL_FOLDER/tiananmen"
alias mm="$SHELL_FOLDER/mount"
alias gits="git switch"
alias gitb="git branch"
alias gitm="git merge"
alias logout="pkill -u $USER"





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


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
