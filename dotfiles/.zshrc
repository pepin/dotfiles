# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="james"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode compleat)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export http_proxy="http://virt-mgr.vm.phx2.llnw.net:80"
#export HTTP_PROXY="http://virt-mgr.vm.phx2.llnw.net:80"
export EDITOR=vim

alias virc='vim ~/.zshrc; source ~/.zshrc'
alias nosetests='nosetests --with-progressive'
alias nt=nosetests
alias vivi='vim ~/.vimrc'
alias rabbit='sudo -u rabbitmq -H rabbitmqctl'
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
alias apt='aptitude'