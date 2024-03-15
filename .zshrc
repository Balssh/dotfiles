export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mikeh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

path+=( $HOME/.cargo/bin )
path+=( $HOME/.local/bin )
path+=('/mnt/c/Users/abals/AppData/Local/Programs/Microsoft VS Code/bin')
path+=("/snap/bin")

alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias cat='bat'
alias grep='rg'
alias ks='kubectl --kubeconfig ~/.kube/config-staging'
alias kp='kubectl --kubeconfig ~/.kube/config-prod'

export http_proxy="http://proxy-dmz.intel.com:911"
export https_proxy="http://proxy-dmz.intel.com:912" 
export ftp_proxy="ftp://proxy-dmz.intel.com:21"
export socks_proxy="proxy-dmz.intel.com:1080" 
export no_proxy="intel.com,*.intel.com,localhost,127.0.0.1,10.0.0.0/8,192.168.0.0/16,172.16.0.0/12"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
