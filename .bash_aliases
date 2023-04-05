alias ref='source ~/.bashrc'

# General purpose aliases
alias rmf='rm -rf'
alias update='sudo apt update && sudo apt upgrade -y'
alias bashrc='nvim ~/.bashrc'
alias cls='clear'
alias CLS='clear'
alias py='python3'
alias python='python3'
alias vi='nvim'
alias vim='nvim'
alias nano='nvim'
alias ali='nvim ~/.bash_aliases'

# Git aliases
alias ghelp='cat ~/.bash_aliases | grep git'
alias gs='git status'
alias gsu='git submodule update'
alias gal='git add .'
alias ga='git add'
alias gpu='git push'
alias gpl='git pull'
alias gm='git commit'
alias gam='git commit --amend'
alias gmm='git commit -m'
alias gll='git log --oneline -n'
alias gl='git log --oneline -n 5'
alias gfx='git commit --fixup=HEAD'
alias gsh='git show'
alias gsh-files='git diff-tree --no-commit-id --name-only -r'
alias gd='git diff'
alias gb='git branch'
# https://stackoverflow.com/questions/1657017/how-to-squash-all-git-commits-into-one
alias groot='git rebase --root -i'
alias gini='git init && git add . && git commit -m "Initial commit"'
alias gck='git checkout'
# show combined sum of git changes in last n commits
alias stat='git diff --stat HEAD~1..HEAD'
alias stat5="git diff --stat HEAD~5..HEAD"
alias stat10="git diff --stat HEAD~10..HEAD"
alias stat15="git diff --stat HEAD~15..HEAD"
alias stat20="git diff --stat HEAD~20..HEAD"
alias stat25="git diff --stat HEAD~25..HEAD"

alias sstat='git diff --shortstat HEAD~1..HEAD'
alias sstat5='git diff --shortstat HEAD~5..HEAD'
alias sstat10='git diff --shortstat HEAD~10..HEAD'
alias sstat15='git diff --shortstat HEAD~15..HEAD'
alias sstat20='git diff --shortstat HEAD~20..HEAD'
alias sstat25='git diff --shortstat HEAD~25..HEAD'

# Navigation
alias to-win='cd /mnt/c/Users/gkk'
alias to=cd
alias edit_aliases="nvim ~/.bash_aliases"
alias edit_history="nvim ~/.bash_history"
alias edit_profile="nvim ~/.bashrc"

# common CLI mistaktes
alias l='ls'
alias ll='ls -l'
alias sl='ls'
alias lsa='ls -la'
alias la='ls -la'

# mac specific aliases
alias finder='open'

# shell config aliases
alias refresh_bash='source ~/.bashrc'
alias refresh_zsh='source ~/.zshrc'
alias warp='open /Applications/Warp.app'
alias getCommand='type'

# https://stackoverflow.com/a/1920585
prettyjson_s() {
    echo "$1" | python -m json.tool
}

prettyjson_f() {
    python -m json.tool "$1"
}

prettyjson_w() {
    curl "$1" | python -m json.tool
}

alias d='sudo docker'
alias docker='sudo docker'
# https://stackoverflow.com/a/70881149
alias clean_docker_config_osx='rm  ~/.docker/config.json'
alias g='git'
alias k='kubectl'

alias ..='cd ..'

# aliases for working with virtual enviroments
alias dac='deactivate'
alias act='source .venv/bin/activate'
