## zsh-completion-generator
#GENCOMPL_FPATH="${HOME}/zsh-completions"
#source '/usr/share/zsh-completion-generator/zsh-completion-generator.plugin.zsh'

autoload -Uz compinit
compinit

# Tab completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# Disabling this option enables tab completion for aliases
#setopt complete_aliases

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Automatically load new executables
zstyle ':completion:*' rehash true
