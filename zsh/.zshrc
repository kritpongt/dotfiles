export ZSH="$HOME/.oh-my-zsh"
typeset -U PATH

# ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-system-clipboard
)
source $ZSH/oh-my-zsh.sh

# -- Vi Mode
set -o vi
export EDITOR=nvim
export VISUAL=nvim
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search

# -- fuzzy find
# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
# export FZF_CTRL_F_COMMAND="$FZF_DEFAULT_COMMAND"
eval "$(fzf --zsh)"

# -- starship
eval "$(starship init zsh)"

# -- zoxide
# eval "$(zoxide init zsh)"

# -- eza
# alias ls="eza --no-filesize --long --color=always --icons=always --no-user"