# zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
setopt autocd
unsetopt beep
bindkey -v

# compinstall
zstyle :compinstall filename '/home/donnie/.zshrc'
autoload -Uz compinit
compinit

# omz
plugins=(
    archlinux
    cargo
    git
    nmap
    systemd
    web-search
)

ZSH=/usr/share/oh-my-zsh/
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# prompt
PROMPT='%~ %F{red}$%f '

# aliases
source ~/.aliases
setopt COMPLETE_ALIASES

# index PATH on tab completion
zstyle ':completion:*' rehash true

# ctrl-shift-arrow word movement
bindkey -e
bindkey '^[[c' forward-word
bindkey '^[[d' backward-word

# search arch repos for commands
source /usr/share/doc/pkgfile/command-not-found.zsh

# vim: sw=4
