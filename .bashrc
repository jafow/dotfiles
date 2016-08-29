# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# source the git-prompt script to show repo status
source ~/.git-prompt.sh

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#    # We have color support; assume it's compliant with Ecma-48
#    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#    # a case would tend to support setf rather than setaf.)
#    color_prompt=yes
#    else
#    color_prompt=yes
#    fi
#fi

if [ "$color_prompt" = yes ]; then
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\e[32m\][\u \W] $(__git_ps1 " (%s)")\e[0m\]\$ '
fi

STARTCOLOR='\e[0;30m';
ENDCOLOR="\e[0m"

# export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"

unset color_prompt force_color_prompt
# Make TERM only available outside of tmux
export TERM=screen-256color
#export TERM=xterm-256color
# If this is an xterm set the title to user@host:dir

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# cd into codesmith faster
alias codesmith='cd ~/Development/codesmith'

#set capslock to backspace a nice one if not caps not already mapped
#alias bkcp='setxkbmap -option caps:backspace'

#source ~/.git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$'

# tmux defaults to tmux -2 for full color support
alias t2='tmux -2'

# alias for cd 
alias ..='cd ..'

# alias for cd ls
alias cdl='cd $1;ls'

# alias for exit
alias xi='exit'

# execute the tmux session to startup slack in the background
alias slack2='~/slack-t2'

# alias to delete old kernel headers
# alias clear-space="dpkg -l 'linux-*' | sed '/^ii/!d;/'\"$(uname -r | sed \"s/\(.*\)-\([^0-9]\+\)/\1/\")\"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge"

# The following shows current git branch
# Colors for the prompt
blue="\033[0;36m"
white="\033[0;37m"
green="\033[0;32m"

# Brackets needed around non-printable characters in PS1
# ps1_blue='\['"$blue"'\]'
# ps1_green='\['"$green"'\]'
# ps1_white='\['"$white"'\]'

# parse_git_branch() {
    # gitstatus=`git status 2> /dev/null`
    # if [[ `echo $gitstatus | grep "Changes to be committed"` != "" ]]
    # then
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
    # elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
    # then
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
    # elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
    # then
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
    # elif [[ `echo $gitstatus | grep "nothing to commit"` != "" ]]
    # then
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    # else
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
    # fi
# }

# # Echo a non-printing color character depending on whether or not the current git branch is the master
# # Does NOT print the branch name
# # Use the parse_git_branch() function for that.
# parse_git_branch_color() {
    # br=$(parse_git_branch)
    # if [[ $br == "(master)" || $br == "(master*)" || $br == "(master**)" || $br == "(master***)" ]]; then
        # echo -e "${blue}"
    # else
        # echo -e "${green}"
    # fi
# }

# No color:
#export PS1="@\h:\W\$(parse_git_branch) \$ "

# With color:
# old ps1
# export PS1="$ps1_blue@\h:$ps1_white\W\[\$(parse_git_branch_color)\]\$(parse_git_branch) $ps1_blue\$$ps1_white"
# export PS1="$ps1_blue\u@\h:\w\a]$ps1_white\W\[\$(parse_git_branch_color)\]\$(parse_git_branch) $ps1_blue\$$ps1_white"

#mkdir and cd into it
function mknd() {
  mkdir $1
  cd $_
}

# cd to a directory and launch tmux
function stmux() {
    cd $1
    t2
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/home/jared/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /home/jared/.travis/travis.sh ] && source /home/jared/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
