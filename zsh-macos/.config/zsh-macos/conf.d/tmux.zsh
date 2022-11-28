## load a tmux session
_load_tmux() {
    if [[ -n "${TMUX}" ]]; then
        echo "Already in a tmux session."
    else
        tmux
    fi
}

zle -N _load_tmux
bindkey -M viins "^y" _load_tmux

# vim: syntax=zsh
