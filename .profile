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

RACKET="~/racket/bin"
CARGO="~/.cargo/bin"
PYENV_ROOT="$HOME/.pyenv/bin"
export RVM="~/.rvm/gems/ruby-2.3.0/bin"
export RVM_BIN="~/.rvm/bin"
export PATH="$RVM_BIN:$RVM:~/.gem:$PYENV_ROOT:~/.npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin/:/bin:$HOME/bin:/usr/bin/java:~/Android/Sdk/tools:~/Android/Sdk/platform-tools:/usr/local/lib:$NODE_PATH:/usr/local/go/bin:$RACKET:$CARGO"
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

