# defaults
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
setopt autocd

# prompt
PROMPT='%~ %F{red}$%f '

# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# aliases
source ~/.aliases
setopt COMPLETE_ALIASES

# auto cd
setopt autocd

# spellcheck
setopt correct
#setopt correctall

# case-insensitive auto-complete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcherlist 'm:{a-z}={A-Za-z}'

# auto cd ls
function chpwd() {
	emulate -L zsh
	ls
}

