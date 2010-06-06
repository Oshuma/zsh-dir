alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# alias _='sudo'
alias dirs='dirs -v'
alias ls='ls --color -F'
alias l='ls -l'
alias la='ls -a'
alias lh='ls -lh'
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
alias rails='nocorrect rails'
alias gemi='gem install --no-ri --no-rdoc '
alias sgemi='sudo gem install --no-ri --no-rdoc '
alias bundle='nocorrect bundle'

# misc
alias pfind='ps aux |grep '
alias getip="curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'"
