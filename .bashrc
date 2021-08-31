#cd sem precisar digitar cd
shopt -s autocd
#cd adimitir erros de ortografia
shopt -s cdspell
#pfetch iniciar da sessão
pfetch

export TERM=xterm-256color

#arquivos de configuração
SHELL_FOLDER=/home/xi/desktop/prog/shell
RC_FOLDER=$HOME/config


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
alias ss="source $HOME/.bashrc"
alias df="df -h" 
alias yt="youtube-dl" 

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


if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
