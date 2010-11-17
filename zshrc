# ----------------------
# zsh config
# ----------------------

# TODO: Split this beast into ~/.zsh/lib/*.zsh

export ZSH_HOME=$HOME/.zsh

# Load the environment variables first.
source $ZSH_HOME/lib/environment.zsh

# Bindings
# bindkey -v
# bindkey '^A' beginning-of-line
# bindkey '^E' end-of-line
# bindkey '^r' history-incremental-search-backward
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# Completion
autoload -Uz compinit
compinit

if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''

# Misc.
autoload colors; colors;
setopt prompt_subst
setopt autocd
unsetopt beep

# smart URL quoting
autoload -U url-quote-magic
zle -N self-insert url-quote-magic


# Load the library files, then custom files.
# TODO: OS detection when loading custom/ files.
for config_file ($ZSH_HOME/lib/*.zsh)    source $config_file
for custom_file ($ZSH_HOME/custom/*.zsh) source $custom_file
