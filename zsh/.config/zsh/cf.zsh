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
