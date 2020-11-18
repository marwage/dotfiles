# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

# theme
prompt redhat

setopt NO_NOMATCH

# directory colour
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# alias
alias ll='ls -la'
alias subl='open -a "Sublime Text"'
alias code='open -a "VSCodium"'

# locale
export LANG=en_GB.UTF-8

