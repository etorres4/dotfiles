# ---------- Normal Aliases ----------
# Common commands
alias cp='gcp -piv'
alias mkdir='gmkdir'
alias mv='gmv -iv'
# Use safe-rm instead of rm
alias rm='safe-rm -iv'
alias rmdir='grmdir -v'

# Games
alias add-modrinth='ferium add-modrinth'

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

# GPG
alias gdk='gpg --delete-keys'
alias gdsk='gpg --delete-secret-keys'
alias gik='gpg --import '
alias gk='gpg --list-keys'
alias grk='gpg --receive-keys'
alias gsk='gpg --list-secret-keys'

# Neomutt
alias neomuttconf='cd -- ${XDG_CONFIG_HOME:-${HOME}/.config}/neomutt'
alias neomuttrc='${EDITOR} ${XDG_CONFIG_HOME:-${HOME}/.config}/neomutt/neomuttrc'

# Neovim
alias nvimcomm='${EDITOR} ${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/commands'
alias nvimconf='cd "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim"'
alias nvimft='cd "${XDG_DATA_HOME:-${HOME}/.local/share}/nvim/site/ftplugin"'
alias nvimplug='${EDITOR} -- "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/plugins.vim"'
alias nvimkey='${EDITOR} -- "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/keybindings.vim"'
alias nvimrc='${EDITOR} -- "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/init.vim"'
alias swapdir='cd -- "${XDG_DATA_HOME:-${HOME}/.local/share}/nvim/swap"'
alias vmore='nvim -u "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/pager.vim" -'

#========= Package Management =========
# Arch Linux
alias aurget='aur sync -d aur'
alias -g autoremove='pacman -Rns $(pacman -Qtdq)'
alias checkaurupdates='aur sync -d aur --upgrades'
# alias does not work correctly for some reason
alias lspkg="pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h"
alias ql='pacman -Qql'
alias pacsearch='pacman -Ss'
alias rpmget='aur sync -d rpm'
alias -g updatemirrors="reflector --verbose --country 'United States' --latest 20 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"

# ========== Packaging ==========
# Arch Linux
alias aurcache='cd ${XDG_CACHE_HOME}/aurutils/sync'
alias aurdir='cd /var/cache/pacman/aur'
alias customdir='cd /var/cache/pacman/custom'
alias gpkginit='cp /usr/share/pacman/PKGBUILD-vcs.proto ./PKGBUILD'
alias pkginit='cp /usr/share/pacman/PKGBUILD.proto ./PKGBUILD'
alias pa='makepkg --force --clean --cleanbuild --syncdeps --rmdeps && addpkg aur'
alias pc='makepkg --force --clean --cleanbuild --syncdeps --rmdeps && addpkg custom'
alias pr='makepkg --force --clean --cleanbuild --syncdeps --rmdeps && addpkg rpm'

# Personal
alias :q='exit'
alias ct='cptemplate'
#alias less='less -i --'
alias la='gls --almost-all --color --group-directories-first --human-readable -l'
alias ls='gls --color --group-directories-first'
alias ll='gls --classify --color --group-directories-first --human-readable -l'
alias python='python3'
alias spcli='speedtest-cli --secure'
alias sshconfig='"${EDITOR}" -- ${HOME}/.ssh/config'
alias tmux='tmux -f "${XDG_CONFIG_HOME:-${HOME}/.config}"/tmux/tmux.conf'
alias tmuxrc='nvim -- "${XDG_CONFIG_HOME:-${HOME}/.config}"/tmux/tmux.conf'
alias tuir='tuir --no-flash'
alias wget='wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"'

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

# ssh
alias scpe='scp -i "${HOME}/.ssh/empress"'

# system
alias bootloader='cd /boot/loader/entries'
alias myip='curl ifconfig.me'
alias restartfans='sudo systemctl restart fancontrol.service'

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

