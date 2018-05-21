# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jaredfowler/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jaredfowler/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jaredfowler/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jaredfowler/.fzf/shell/key-bindings.bash"

