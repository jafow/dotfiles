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




export MAVEN="/usr/local/lib/apache-maven-3.3.9/bin"
export PATH="~/.npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin/:/bin:$HOME/bin:/usr/bin/java:~/Android/Sdk/tools:~/Android/Sdk/platform-tools:/usr/local/lib:$NODE_PATH:/usr/local/go/bin:$MAVEN"
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export GOPATH="$HOME/work"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
#phantomjs
export PHANTOM_JS="/usr/local/bin/phantomjs"

