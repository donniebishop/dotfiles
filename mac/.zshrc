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
