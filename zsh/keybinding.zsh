# -*- sh -*-

bindkey -e                      # emacs like keybind
bindkey '^[^B' vi-backward-blank-word
bindkey '^[^F' vi-forward-blank-word
bindkey '^[h' backward-kill-word
bindkey '^h' backward-delete-char

# ./..
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^^' cdup

# emacs like C-k
function copy-line-as-kill() {
    zle kill-line
    if [[ -n ${CUTBUFFER} ]]; then
        echo -n "${CUTBUFFER}" | pbcopy
    fi
}
zle -N copy-line-as-kill
bindkey '^k' copy-line-as-kill

# Sync with macOS clipboard
function clipboard-yank () {
    CUTBUFFER=$(pbpaste)
    zle yank
}
zle -N clipboard-yank
bindkey '^y' clipboard-yank

function reload() {
    source ~/.zshrc
}

function ghe() {
	  case $1 in
		    get )
            if [[ -z "$GHE_HOST" ]]; then
                echo "You must set a value to $GHE_HOST"
            else
			          ghq get $GHE_HOST:$2
            fi
			      ;;
		    * )
			      ghq $@
			      ;;
	  esac
}

function private() {
    if $(git rev-parse --is-inside-work-tree 2> /dev/null); then
        git config user.name "ganmacs"
        echo "Set user.name as $(git config --get user.name)"
        git config user.email "ganmacs@gmail.com"
        echo "Set user.email as $(git config --get user.email)"
    fi
}
