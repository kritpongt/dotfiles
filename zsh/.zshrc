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

# -- fzf-git
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
eval "$(fzf --zsh)"

# -- zoxide
eval "$(zoxide init zsh)"

# -- starship
eval "$(starship init zsh)"

# -- Aliases
# -- eza
alias ls="eza --icons=always"