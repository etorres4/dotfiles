# allows substitution in the prompt
setopt PROMPT_SUBST

# ========== VCS info ==========
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git*' formats "%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m %u %c%{$reset_color%}"
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%{$fg[blue]%}%b%{$reset_color%}%m %u %c%{$reset_color%}"

# ========== Vim Command Mode ==========
vim_ins_mode='ins'
vim_cmd_mode='cmd'
vim_mode=${vim_ins_mode}

zle-keymap-select() {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

zle-line-finish() {
  vim_mode=${vim_ins_mode}
}
zle -N zle-line-finish

# ========== Final Prompt ==========
precmd() {
    vcs_info
}

#PS1='%F{blue}%n%f@%m %F{green}%3~%f > '
#RPS1='%F{green}${vim_mode}%f ${vcs_info_msg_0_} [%F{red}%?%f]'
PS1='%F{green}%3~%f %F{blue}>%f '
RPS1='${vcs_info_msg_0_} [%F{red}%?%f]'
