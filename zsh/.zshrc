export ZSH="$HOME/.oh-my-zsh"
export DOTFI_SCRIPT="$HOME/dotfiles/.config/scripts"
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
export EDITOR=nvim
export VISUAL=nvim

typeset -U PATH

# ZSH_THEME="robbyrussell"

plugins=(
    git
    fzf-tab
    zsh-system-clipboard
    zsh-syntax-highlighting
)
if [ -f "$ZSH/oh-my-zsh.sh" ]; then source "$ZSH/oh-my-zsh.sh"; fi

# -- vi mode
set -o vi
export KEYTIMEOUT=1

# -- key binding
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search

# -- initial
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# -- fzf-git
if [ -f "$DOTFI_SCRIPT/fzf-git.sh" ]; then source "$DOTFI_SCRIPT/fzf-git.sh"; fi
export FZF_DEFAULT_OPTS="--bind 'ctrl-l:accept'"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -- fzf-tab
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
zstyle ':fzf-tab:*' fzf-flags '--bind=ctrl-l:accept'

# -- aliases
# -- tmux
alias tmux="tmux -f $TMUX_CONF"