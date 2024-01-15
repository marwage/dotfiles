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
        alias code='open -a Visual\ Studio\ Code'
        alias vi='nvim'
    ;;
    Linux)
        alias ll='ls -la --color'
        alias ls='ls --color'
        alias vi='nvim'
    ;;
esac

# locale (need for mosh)
export LANG=en_GB.UTF-8 LC_CTYPE=en_GB.UTF-8

# PATH
case `uname` in
    Darwin)
	export PATH=/opt/homebrew/bin:$PATH
	eval "$(/opt/homebrew/bin/brew shellenv)"

	export PATH=$PATH:/Users/$USER/go/bin
    ;;
    Linux)
	export PATH=$PATH:/home/$USER/.local/bin
	export PATH=$PATH:/home/$USER/go/bin
	export PATH=$PATH:/usr/local/go/bin
    ;;
esac

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# prompt
PS1='%n@%m %2d$ '

# add ssh key
case `uname` in
    Darwin)
	ssh-add --apple-use-keychain
    ;;
esac

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcel/Developer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marcel/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marcel/Developer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marcel/Developer/google-cloud-sdk/completion.zsh.inc'; fi
