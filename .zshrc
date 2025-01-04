# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# abrir terminal dentro de uma sessão tmux
if [[ $(command -v tmux) ]] && [[ -z $TMUX ]] && [[ $TERM != "screen" ]] && [[ $- == *i* ]]; then
     exec tmux new-session \; choose-tree
fi

# fundo fosco
xsetroot -solid "#030f1c"

export WINEPREFIX=$HOME/.winevn
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin/
export _JAVA_AWT_WM_NONREPARENTING=1
export BROWSER=google-chrome-stable
export DISABLE_AUTO_UPDATE=true
export VISUAL="nvim --noplugin"
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/.npm/bin"
export PATH=$PATH:~/.dotnet/tools/
export PATH=$PATH:~/.ghcup/bin/
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

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

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="nicoulaj"
# ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    # zsh-autosuggestions
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


function ytmpv {
    LINK=$(xclip -selection clipboard -o)
    mpv "$LINK" > /dev/null 2&>1 &
}

function forkmpv {
    mpv "$@" > /dev/null 2&>1 &
}

function forkmpvloop {
    for link in "$@"; do
        echo $link
        forkmpv "$link" --loop=yes
    done
}

alias fml="forkmpvloop"

function fizzbuzz {
    if [[ -z $1 ]]; then
        till=30
    else
        till=$1
    fi
    for i in {1..$till}; do
        local i3=$(( $i % 3 ))
        local i5=$(( $i % 5 ))
        if [[ $i3 == 0 ]] && [[ $i5 == 0 ]]; then
            echo fizzbuzz
        elif [[ $i3 == 0 ]]; then
            echo fizz
        elif [[ $i5 == 0 ]]; then
            echo buzz
        else
            echo $i
        fi
    done
}

#aliases, shortcuts
alias ls="ls -l --color=auto --group-directories-first"
alias rm="rm -I"
alias cp="cp -r"
alias la="ls -a"
alias l="ls -lh"
alias du="du --apparent-size"
alias neofetch="neofetch --disable resolution icons host theme"
alias clip="xclip -selection clipboard" 
alias so="source $HOME/.zshrc"
alias df="df -h" 
alias jpwine="LC_ALL=ja_JP.sjis wine" 
alias lt='ls --human-readable --size -1 -S --classify' 
alias logout="pkill -u $USER"
alias ffmpeg="time ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias rsync="time rsync -vP" 
alias temp='curl "https://wttr.in/?format=3"'
alias gcc="time gcc"
alias ssh="ssh -qXYC"
alias :q="exit"
# alias smartctl="smartctl -a -T permissive"
alias vim="nvim"
alias nsxiv="nsxiv -a"
alias tsxiv="/usr/bin/ls -t | nsxiv -a - 2>/dev/null"
alias h2d="printf '%d\n'"
alias d2h="printf '%02x\n'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
