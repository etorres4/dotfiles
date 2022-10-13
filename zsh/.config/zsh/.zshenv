# Local Environment Variables
#export SSH_ASKPASS='/usr/bin/ksshaskpass ssh-add < /dev/null'

#export FZF_DEFAULT_COMMAND="fd --threads $(nproc) --type f --hidden --color=never"

# XDG Base Directory Support
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/.config}/java"
export KDEHOME="${XDG_CONFIG_HOME}/kde"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"
export PYLINT_HOME="${XDG_CACHE_HOME}/pylint"
export PYTHON_EGG_CACHE="${XDG_CACHE_HOME}/python-eggs"
export PYTHON_STARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export UNCRUSTIFY_CONFIG="${XDG_CONFIG_HOME}/uncrustify.conf"
export WINEPREFIX="${XDG_DATA_HOME}/wine"

# nnn
#export NNN_OPTS_PROG=1
#export NNN_TRASH=1
#export NNN_USE_EDITOR=1

#export HOMEBREW_NO_AUTO_UPDATE=1

#export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/:$LD_LIBRARY_PATH"

export PAGER="nvimpager"
export AUR_PAGER="ranger"

# Manpager using vim/nvim
#export MANPAGER='nvim +Man!'
#export MANWIDTH=999
