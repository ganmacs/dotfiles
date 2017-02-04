# -*- sh -*-

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
setopt extended_history         # add history time
setopt hist_ignore_dups         # ignore duplicated history
setopt hist_ignore_space        # ignore excess space
setopt hist_reduce_blanks       # reduce excess blank
setopt inc_append_history       # add a command into history incrementaly
setopt share_history            # share hisotory between zsh processes
setopt no_flow_control          # C-s, C-qを無効にする

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
