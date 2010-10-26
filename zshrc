# ----------------------
# zsh config
# ----------------------

# TODO: Split this beast into ~/.zsh/lib/*.zsh

export ZSH_HOME=$HOME/.zsh

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


# ----------------------
# variables
# ----------------------
export PATH=$PATH:$HOME/.zsh/bin
export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export LC_ALL=C
export PAGER=less
export LESS='-F -M -R -X'
export IRB_HISTORY_FILE=$HOME/.irb_history


# ----------------------
# functions
# ----------------------

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

# function trash {
#   mv -i $* $HOME/.Trash/
# }


# Load the library files, then custom files.
# TODO: OS detection when loading custom/ files.
for config_file ($ZSH_HOME/lib/*.zsh)    source $config_file
for custom_file ($ZSH_HOME/custom/*.zsh) source $custom_file
