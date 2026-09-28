export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

zstyle ':omz:update' mode auto

COMPLETION_WAITING_DOTS="true"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(/opt/homebrew/bin/brew shellenv)"
