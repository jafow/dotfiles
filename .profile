[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# gpg-agent tty
GPG_TTY=$(tty)
export GPG_TTY

PYTHON3="/usr/bin/python3"
PIP3="/usr/local/lib/pip3"
PYENV_ROOT="$HOME/.pyenv"
RACKET="~/racket/bin"
CARGO="~/.cargo/bin"
USER_BASE_PATH="$HOME/.local"
export RVM="~/.rvm/gems/ruby-2.3.0/bin"
export RVM_BIN="~/.rvm/bin"
export PATH="$USER_BASE_PATH:$RVM_BIN:$RVM:~/.gem:~/.npm-global/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin/:/bin:/usr/bin/java:~/Android/Sdk/tools:~/Android/Sdk/platform-tools:/usr/local/lib:$NODE_PATH:/usr/local/go/bin:$PYENV_ROOT/bin:$PYTHON3:$PIP3:$RACKET:$CARGO"
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export GOPATH="$HOME/go"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
export NVM_DIR="$HOME/.nvm"
export NODE_PATH="/usr/lib/node_modules"
#phantomjs
export PHANTOM_JS="/usr/local/bin/phantomjs"

#my machine name
export MYMACHINENAME="goodcomputer"

#my machine color
export MYMACHINECOLOR="033;01;34m"

