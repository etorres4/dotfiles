# ---------- Normal Aliases ----------
# Common commands
alias cp='cp -piv'
alias mv='mv -iv'
# Use safe-rm instead of rm
alias rm='safe-rm -iv'
alias rmdir='rmdir -v'

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
alias gmv='git mv'
alias grm='git rm'
alias gs='git status'
alias gtv='printf "%s" "$(git describe --long | sed "s/\([^-]*-\)g/r\1/;s/-/./g")"'
alias gnv='printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"'
alias gr='git reset'

#========= Package Management =========
# Arch Linux
alias aurget='aur sync -d aur --chroot'
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

# firewall
alias -g fwcmd='firewall-cmd'
alias -g fwla='firewall-cmd --list-all'
alias -g fwlsp='firewall-cmd --list-ports'
alias -g fwlss='firewall-cmd --list-services'

# Programming
# Use python-pytest-xdist plugin
#alias pytest='pytest --numprocesses=$(nproc)'
alias pyarchive='git archive -o rbackup-"$(python setup.py --version)".tar.gz --prefix=rbackup-"$(python setup.py --version)"/'

# Personal
alias la='ls --almost-all --color --group-directories-first --human-readable -l'
alias ls='ls --color --group-directories-first'
alias ll='ls --classify --color --group-directories-first --human-readable -l'

# system
alias bootloader='cd /boot/loader/entries'
alias restartfans='sudo systemctl restart fancontrol.service'
alias dcips=$'docker inspect -f \'{{.Name}}-{{range  $k, $v := .NetworkSettings.Networks}}{{$k}}-{{.IPAddress}} {{end}}-{{range $k, $v := .NetworkSettings.Ports}}{{ if not $v }}{{$k}} {{end}}{{end}} -{{range $k, $v := .NetworkSettings.Ports}}{{ if $v }}{{$k}} => {{range . }}{{ .HostIp}}:{{.HostPort}}{{end}}{{end}} {{end}}\' $(docker ps -aq) | column -t -s-'

# zsh
alias zdotdir='cd -- ${ZDOTDIR}'
alias zshaliases='${EDITOR} -- "${XDG_CONFIG_HOME}"/zsh-linux/00-linux-aliases.zsh'
alias zbindings='${EDITOR} -- ${ZDOTDIR}/keybindings.zsh'
alias zhist='${EDITOR} -- ${HISTFILE}'
alias zpath='${EDITOR} -- ${ZDOTDIR}/path.zsh'
alias zprompt='${EDITOR} -- ${ZDOTDIR}/prompt.zsh'
alias zshrc='${EDITOR} -- ${ZDOTDIR}/.zshrc'
alias zshrefresh='source -- ${ZDOTDIR}/.zshrc'
alias zshenv='${EDITOR} -- ${XDG_CONFIG_HOME}/zsh-linux/zshenv'

# ---------- Parameterized Aliases ----------
# List all binaries of a given package
lsbin() {
    if [[ -n $1 ]]; then
        pacman -Qql $1 | rg bin
    else
        return 0
    fi
}

# Use GNU long flags
stow-config() {
    local dotfile_dir="${HOME}/Dotfiles"

    for conf in "${@}"; do
        if [[ -n ${conf} ]]; then
            mkdir --parents "${dotfile_dir}/${conf}/.config"
            mv "${XDG_CONFIG_HOME}/${conf}" "${dotfile_dir}/${conf}/.config"
            cd "${dotfile_dir}" && stow "${conf}"
            cd -
        else
            continue
        fi
    done
}
