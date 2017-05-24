# -*- sh -*-

export LANG=en_US.UTF-8
# export EDITOR=/usr/local/bin/vim

# show statics info
REPORTTIME=1

setopt no_beep                  # no beep
setopt auto_list                # show all candidates
setopt mark_dirs                # add / when it is directory
setopt correct                  # correct typo
setopt auto_remove_slash        # remove /
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_tify
setopt ignoreeof                # Do not logout by Ctrl-D

# Select word style
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{}.,|-_"
zstyle ':zle:*' word-style unspecified

# others
export PATH="/usr/local/heroku/bin:$PATH" # Added by the Heroku Toolbelt
export PATH="$HOME/src/github.com/ganmacs/dotfiles/bin:$PATH"
export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
