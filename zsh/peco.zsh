# -*- sh -*-

alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias ff='find . -name "*" | peco | xargs open'
alias fe='find . -name "*" | peco | xargs open -a emacs'

alias gibol='gibo -l | tr "\t" "\n" | sed "/^=/d" | sort | peco | xargs gibo'
alias cmsgi='cmsg --no-merges | peco'

# show all repositories by ghq list
function peco-ghq() {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${GOPATH}/src/${selected_dir}"
        zle accept-line
    fi
    zle redisplay
}
zle -N peco-ghq
bindkey '^q' peco-ghq

# show all braches at this repository
function peco-branches() {
    local selected_branch="$(git branch | peco --query "$LBUFFER" | sed -e "s/^\*[ ]*//g")"
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle redisplay
}
zle -N peco-branches
bindkey '^[g' peco-branches

# search files
function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    result=''
    for file in $selected_files; do
        result="${result}$(echo $file | tr '\n' ' ')"
    done

    BUFFER="${BUFFER}${result}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^s' peco-find-file

# show all histories
function peco-find-history() {
    BUFFER=$(fc -l -n -r 1 | peco )
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-history
bindkey '^r' peco-find-history
