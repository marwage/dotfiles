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
case `uname` in
    Darwin)
        alias ll='ls -la'
        alias nova='open -a Nova'
        alias code='open -a VSCodium'
    ;;
    Linux)
        alias ll='ls -la --color'
        alias ls='ls --color'
    ;;
esac

# locale (need for mosh)
export LANG=en_GB.UTF-8 LC_CTYPE=en_GB.UTF-8

# path
export PATH=/usr/local/sbin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
