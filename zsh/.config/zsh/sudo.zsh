# Press escape twice to prepend the previous command with "sudo"
sudo-command-line() {
    [[ -z ${BUFFER} ]] && zle up-history
    if [[ ${BUFFER} == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ ${BUFFER} == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ ${BUFFER} == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey -M viins "\e\e" sudo-command-line
bindkey -M vicmd "\e\e" sudo-command-line
