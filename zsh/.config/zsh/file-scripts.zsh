# Shell integrations for file-scripts
# Fuzzy-find a file and open it in less
_run_fless() {
    fless && zle reset-prompt
}

zle -N _run_fless
bindkey -M viins '^n' _run_fless

# Fuzzy find a file and then edit it

_run_fedit() {
    fedit && zle reset-prompt
}

_run_etcedit() {
    fedit --etc && zle reset-prompt
}

zle -N _run_fedit
bindkey -M viins '^o' _run_fedit

zle -N _run_etcedit
bindkey -M viins '^e' _run_etcedit
