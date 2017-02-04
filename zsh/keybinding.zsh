# -*- sh -*-

bindkey -e                      # emacs like keybind
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
			      # You must export $GHE_HOST in ~/.zshrc.local
			      ghq get $GHE_HOST:$2
			      ;;
		    * )
			      ghq $@
			      ;;
	  esac
}
