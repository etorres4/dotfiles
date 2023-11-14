# Setup fzf
# ---------
fzf_version="$(fzf --version | cut -d ' ' -f1 | tr -d '[:space:]')"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/${fzf_version}/shell/completion.zsh"

# Key bindings
# ------------
source "/usr/local/Cellar/fzf/${fzf_version}/shell/key-bindings.zsh"
