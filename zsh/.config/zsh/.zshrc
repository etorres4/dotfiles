# User-specific zsh configuration

# Default umask value
umask 0027

# ========== Functions ==========
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

# Fuzzy cd from anywhere
# Dependencies
# * fzf
# * mlocate

cf() {
    [[ -z "${*}" ]] && return 1
    [[ ! -x $(which fzf) ]] && return 1

    #dir="$(locate --all --ignore-case --null -- "${@}" | fzf --read0 --select-1 --exit-0)"
    #dir="$(locate -0i -- "${@}" | fzf --read0 --select-1 --exit-0)"
    dir="$(fd --ignore-file "${XDG_CONFIG_HOME}/fd_ignore" --print0 --type d -- "${@}" | fzf --read0 --select-1 --exit-0)"

    [[ -z "${dir}" ]] && return 1
 
    if [[ -f "${dir}" ]]; then
        cd "${dir%/*}"
    else
        cd "${dir}"
    fi
}

autoload -Uz cf

# Make a directory, then change into it

mkcd() {
    [[ ! -d "${1}" ]] && mkdir --parents -- "${1}"
    cd "${1}" || exit
}

autoload -Uz mkcd

# Detect OS to autoload uncommon config files
if [[ "$(uname)" == "Darwin" ]]; then
    for dotfile in "${XDG_CONFIG_HOME}"/zsh-macos/**/*(.); do
        source $dotfile
    done
    test -e /Users/etorres/.config/zsh/.iterm2_shell_integration.zsh && source /Users/etorres/.config/zsh/.iterm2_shell_integration.zsh || true
else
    for dotfile in "${XDG_CONFIG_HOME}"/zsh-linux/**/*; do
        source $dotfile
    done
fi
