# shell specific aliases
if [ "$SHELL" = "/bin/bash" ]; then
    alias refresh=refresh_bash
elif [ "$SHELL" = "/bin/zsh" ]; then
    alias refresh=refresh_zsh
else
    echo "Unknown shell, please adjust .*rc file refresh alias."
fi

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
alias ga='git add .'
alias gpu='git push'
alias gpl='git pull'
alias gmm='git commit -m'
alias gll='git log --oneline -n'
alias gl='git log --oneline -n 5'
alias gfx='git commit --fixup=HEAD'
alias gsh='git show'
alias gd='git diff'
alias gb='git branch'
# https://stackoverflow.com/questions/1657017/how-to-squash-all-git-commits-into-one
alias groot='git rebase --root -i'
alias gini='git init && git add . && git commit -m "Initial commit"'
alias gck='git checkout'

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

alias d='docker'
alias g='git'
alias k='kubectl'

alias ..='cd ..'

