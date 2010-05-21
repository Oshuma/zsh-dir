# ----------------------
# zsh config
# ----------------------

# TODO: Split this beast into ~/.zsh/lib/*.zsh

export ZSH_HOME=$HOME/.zsh

# History
HISTFILE=$ZSH_HOME/tmp/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt hist_verify
setopt extended_history
setopt hist_expire_dups_first

# Bindings
bindkey -e
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

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
# export PATH=$PATH:/sbin:/usr/sbin
export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export LC_ALL=C
export PAGER=less
export LESS='-M -R -X'
export IRB_HISTORY_FILE=$HOME/.irb_history


# ----------------------
# aliases
# ----------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias _='sudo'
alias dirs='dirs -v'
alias ls='ls --color -F'
alias l='ls -l'
alias la='ls -a'
alias lh='ls -lh'
alias rails='nocorrect rails'
alias scr='screen -A -m -S'

# git
alias git='nocorrect git' # no zsh correction for 'git'
alias ga='git add'
alias gb='git branch -a -v'
alias gd='git diff'
alias gi='git status; echo; git branch -av'
alias gm='git merge '
alias gnb='git checkout -b ' # must pass new branch name

# ruby
alias ra='rake'
alias rt='rake --tasks'
alias gemi='gem install --no-ri --no-rdoc '
alias sgemi='sudo gem install --no-ri --no-rdoc '
alias bundle='nocorrect bundle'

# misc
alias pfind='ps aux |grep '
alias getip="curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'"


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
for config_file ($ZSH_HOME/lib/*.zsh)    source $config_file
for custom_file ($ZSH_HOME/custom/*.zsh) source $custom_file
