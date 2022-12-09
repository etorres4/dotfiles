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

#========= Package Management =========
# Navigation
alias dirconf='"${EDITOR}" -- "${XDG_CONFIG_HOME:-${HOME}/.config}/user-dirs.dirs"'
alias dotfiles='cd "${HOME}/Dotfiles"'
alias xch='cd -- ${XDG_CONFIG_HOME:-${HOME}/.config}'
alias xcah='cd -- ${XDG_CACHE_HOME:-${HOME}/.cache}'
alias xdh='cd -- ${XDG_DATA_HOME:-${HOME}/.local/share}'

# Programming
# Use python-pytest-xdist plugin
#alias pytest='pytest --numprocesses=$(nproc)'
alias pyarchive='git archive -o rbackup-"$(python setup.py --version)".tar.gz --prefix=rbackup-"$(python setup.py --version)"/'

# system
alias myip='curl ifconfig.me'

# zsh
alias zdotdir='cd -- "$ZDOTDIR"'
alias zshaliases='${EDITOR} -- "$XDG_CONFIG_HOME"/zsh-macos/00-aliases.zsh'
alias zbindings='${EDITOR} -- "$XDG_CONFIG_HOME"/zsh/00-keybindings.zsh'
alias zconf='cd -- $ZDOTDIR'
alias zhist='${EDITOR} -- "${HISTFILE}"'
alias zpath='${EDITOR} -- "$XDG_CONFIG_HOME"/zsh-macos/path.zsh'
alias zprompt='${EDITOR} -- "$ZDOTDIR"/prompt.zsh'
alias zshrc='${EDITOR} -- "$ZDOTDIR"/.zshrc'
alias zshenv='${EDITOR} -- "$ZDOTDIR"/.zshenv'

# ---------- Parameterized Aliases ----------
# Use macOS-specific flags
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

