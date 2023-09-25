# ---------- Normal Aliases ----------
# Common commands
alias cp='gcp -piv'
alias mkdir='gmkdir'
alias mv='gmv -iv'
# Use safe-rm instead of rm
alias rm='safe-rm -iv'
alias rmdir='grmdir -v'

# Git
alias gar='git archive'
alias gb='git branch'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gconf='${EDITOR} -- "${XDG_CONFIG_HOME:-${HOME}/.config}/git/config"'
#alias gmv='git mv'
alias grm='git rm'
alias gs='git status'
alias gtv='printf "%s" "$(git describe --long | sed "s/\([^-]*-\)g/r\1/;s/-/./g")"'
alias gnv='printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"'
alias gr='git reset'

# Personal
alias la='gls --almost-all --color --group-directories-first --human-readable -l'
alias ls='gls --color --group-directories-first'
alias ll='gls --classify --color --group-directories-first --human-readable -l'
alias pacsearch='pacman -Ss'

# system
alias myip='curl ifconfig.me'
alias pipupgrade='pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U'

# zsh
alias zdotdir='cd -- ${ZDOTDIR}'
alias zshaliases='${EDITOR} -- "${XDG_CONFIG_HOME}"/zsh-macos/00-macos-aliases.zsh'
alias zbindings='${EDITOR} -- ${ZDOTDIR}/keybindings.zsh'
alias zhist='${EDITOR} -- ${HISTFILE}'
alias zpath='${EDITOR} -- ${XDG_CONFIG_HOME}/zsh-macos/path.zsh'
alias zprompt='${EDITOR} -- ${XDG_CONFIG_HOME}/zsh-macos/prompt.zsh'
alias zshrc='${EDITOR} -- ${ZDOTDIR}/.zshrc'
alias zshrefresh='source -- ${ZDOTDIR}/.zshrc'
alias zshenv='${EDITOR} -- "${XDG_CONFIG_HOME}"/zsh-macos/zshenv'

# ---------- Parameterized Aliases ----------
# Use macOS-specific command line flags
stow-config () {
    local dotfile_dir="${HOME}/Dotfiles"

    for conf in "${@}"; do
        if [[ -n ${conf} ]]; then
            mkdir -p "${dotfile_dir}/${conf}/.config"
            mv "${XDG_CONFIG_HOME}/${conf}" "${dotfile_dir}/${conf}/.config"
            cd "${dotfile_dir}" && stow "${conf}"
            cd -
        else
            continue
        fi
    done
}

getwifipassword() {
    security find-generic-password -ga "$1" | rg "password"
}

