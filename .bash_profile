
# check OS
if [ "$(uname -s)" = "Darwin" ]; then
OS="OSX"
else
OX=$(uname -s)
fi

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
    SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
    DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/dotfiles" ]; then
        DOTFILES_DIR="$HOME/dotfiles"
else
    echo "Unable to find dotfiles, exiting." return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/.{function,path,env,alias,prompt,npm-completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
    echo "did this: $DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
        done
fi

# source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && "$NVM_DIR/nvm.sh"

# source git-completion
source "$DOTFILES_DIR/.git-completion.bash"

