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
alias vi='nvim'
alias tgz='tar -czvf'
alias utgz='tar -xvf'
alias goi='GOBIN=$(pwd)/bin go install -v ./...'
alias ls='eza'
alias ll='eza -la'
alias tmw='tmux attach-session -t marcel || tmux new-session -s marcel'
alias cd='z'
case `uname` in
    Darwin)
        # alias ll='ls -lah'
        alias code='open -a Visual\ Studio\ Code'
        alias excel='open -a Microsoft\ Excel'
        alias cursor='open -a Cursor'
    ;;
    Linux)
        # alias ll='ls -la --color'
        # alias ls='ls --color'
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
	export PATH=$PATH:/usr/local/cuda/bin
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

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# Latex
if [[ -d "/usr/local/texlive/2024/bin/x86_64-linux" ]]; then
    export PATH=$PATH:/usr/local/texlive/2024/bin/x86_64-linux
fi

# Nix
case `uname` in
    Linux)
        test -n "$NIX_GCROOT" || nix develop $HOME/dotfiles -c zsh
    ;;
esac

# Direnv
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"
# Zoxide
command -v zoxide &> /dev/null && eval "$(zoxide init zsh)"
# Pay respects
command -v pay-respects &> /dev/null && eval "$(pay-respects zsh --alias)"
# Starship
command -v starship &> /dev/null && eval "$(starship init zsh)"


# Git worktree add
gwa() {
  local repo_name=$(basename "$(git rev-parse --show-toplevel)")
  local branch_name=$1
  local target_path="../${repo_name}-${branch_name}"
  local target_branch="mw/${branch_name}"

  git worktree add -b "$target_branch" "$target_path" && cd "$target_path"
}
