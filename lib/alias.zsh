alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'

alias _='sudo'
alias dirs='dirs -v'
alias ls='ls --color -F'
alias l='ls -l'
alias la='ls -la'
alias lsa='ls -a'
alias lh='ls -lh'
alias scr='screen -A -m -S'

# git
alias git='nocorrect git' # no zsh correction for 'git'
alias ga='git add'
alias gb='git branch -a -v'
alias gcm='git commit -m ' # must pass commit message
alias gd='git diff'
alias gi='git status; echo; git branch -av'
alias gm='git merge '
alias gnb='git checkout -b ' # must pass new branch name

# ruby
alias ra='rake'
alias rt='rake --tasks'
alias bra='bundle exec rake'
alias brt='bundle exec rake --tasks'
alias gemi='gem install --no-ri --no-rdoc '
alias sgemi='sudo gem install --no-ri --no-rdoc '

# misc
alias apt_upgrade="sudo apt-get update && sudo apt-get upgrade -y"
alias deny_ip="sudo $HOME/.zsh/bin/deny_ip"
alias pfind='ps aux |grep '
alias getip="curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'"
