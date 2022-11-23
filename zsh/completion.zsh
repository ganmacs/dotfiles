# -*- sh -*-
# zsh-completions

fpath=(~/.zsh/completions "${HOMEBREW_PREFIX}/Homebrew/completions/zsh/_brew" $fpath)
autoload -U compinit
compinit -u

setopt complete_in_word
setopt magic_equal_subst
setopt always_last_prompt
setopt auto_menu

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
