# ---------- Normal Aliases ----------
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

# Personal
alias :q='exit'
alias ct='cptemplate'
alias less='less -i --'
alias la='ls --almost-all --color --group-directories-first --human-readable -l'
alias ls='ls --color --group-directories-first'
alias ll='ls --classify --color --group-directories-first --human-readable -l'
alias python='python3'
alias spcli='speedtest-cli --secure'
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
alias sshconfig='"${EDITOR}" -- ${HOME}/.ssh/config'

# system
alias myip='curl ifconfig.me'

# zsh
alias zdotdir='cd -- ${ZDOTDIR:-${HOME}/.zsh}'
alias zshaliases='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/conf.d/00-aliases.zsh'
alias zbindings='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/conf.d/keybindings.zsh'
alias zhist='${EDITOR} -- ${HISTFILE}'
alias zmod='cd -- ${ZDOTDIR:-${HOME}/.zsh}/conf.d/modules'
alias zpath='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/conf.d/path.zsh'
alias zprompt='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/conf.d/prompt.zsh'
alias zshrc='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/.zshrc'
alias zshrefresh='source -- ${ZDOTDIR:-${HOME}/.zsh}/.zshrc'
alias zshenv='${EDITOR} -- ${ZDOTDIR:-${HOME}/.zsh}/.zshenv'