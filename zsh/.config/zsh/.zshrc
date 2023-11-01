# User-specific zsh configuration

# Default umask value
umask 0027

# Detect OS to autoload uncommon config files
if [[ "$(uname)" =~ "Darwin" ]]; then
    for dotfile in "$XDG_CONFIG_HOME"/zsh-macos/*zsh*(.); do
        source $dotfile
    done
elif [[ "$(uname)" =~ "Linux" ]]; then
    for dotfile in "$XDG_CONFIG_HOME"/zsh-linux/*(.); do
        source $dotfile
    done
fi
