# Minimal ZSH configuration

# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Better key bindings
bindkey -v

# Useful options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt INTERACTIVE_COMMENTS

# Basic prompt
PROMPT='%n@%m:%~ %# '

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias ls='ls -G'
