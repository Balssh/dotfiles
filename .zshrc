export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mikeh"

plugins=( 
    ssh-agent
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

if [[ ! -n ${SSH_CONNECTION} ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
# Enable ssh-agent forwarding
zstyle :omz:plugins:ssh-agent agent-forwarding yes

# Load ssh identities
zstyle :omz:plugins:ssh-agent identities ~/.ssh/github_personal

source $ZSH/oh-my-zsh.sh

# (cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh
# (bash ~/.cache/wal/colors-zsh.sh &)

path+=( $HOME/.cargo/bin )

alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias cat='bat'
alias grep='rg'
alias hx='helix'
alias icat="kitten icat"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
