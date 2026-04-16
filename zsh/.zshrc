export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim

typeset -U PATH

# ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-system-clipboard

    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# -- Vi Mode
set -o vi
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search
export KEYTIMEOUT=1

# -- fuzzy find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_F_COMMAND="$FZF_DEFAULT_COMMAND"
eval "$(fzf --zsh)"

# -- zoxide
eval "$(zoxide init zsh)"

# -- starship
eval "$(starship init zsh)"

# -- Aliases
# -- eza
alias ls="eza --color=always --icons=always"