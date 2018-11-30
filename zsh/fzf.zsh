# -*- sh -*-

alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias gibol='gibo -l | tr "\t" "\n" | sed "/^=/d" | sort | peco | xargs gibo'
alias fzf-t="fzf-tmux -d 20 --exact --no-sort --bind 'ctrl-k:kill-line' --bind 'ctrl-v:page-down' --bind 'alt-v:page-up'"

# show all repositories by ghq list
function fzf-ghq() {
    local selected_dir=$(ghq list | fzf-t)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${GOPATH}/src/${selected_dir}"
        zle accept-line
    fi
    zle redisplay
}
zle -N fzf-ghq
bindkey '^q' fzf-ghq

# show all braches at this repository
function fzf-branches() {
    local selected_branch="$(git branch | fzf-t | sed -e "s/^\*[ ]*//g")"
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle redisplay
}
zle -N fzf-branches
bindkey '^[g' fzf-branches

# show all histories
function fzf-find-history() {
    BUFFER=$(fc -l -n -r 1 | fzf-t)
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N fzf-find-history
bindkey '^r' fzf-find-history
