# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

function pathmunge () {
    egr="/bin/egrep"
    if [ -x "/bin/egrep" ]; then
        egr="/bin/egrep"
    elif [ -x "/usr/bin/egrep" ]; then
        egr="/usr/bin/egrep"
    fi
    if ! echo $PATH | $egr -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b $HOME/.dir_colors`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Config files
alias rc='source ~/.bashrc'
alias vi='vim'
# alias virc='svn update ~/.bashrc; vi ~/.bashrc; source ~/.bashrc; svn ci ~/.bashrc -m "virc bashrc auto-update"'
alias virc='vi ~/.bashrc; rc'
#alias vimy='vi ~/.mybashrc; source ~/.mybashrc'
alias vivi='vi ~/.vimrc'
alias vigit='vi ~/.gitconfig'
#alias vipr='vi ~/.procmailrc'

#include common bash setup
if [ -f $HOME/.bash/common ]; then
    source $HOME/.bash/common
fi

alias apt='aptitude'
