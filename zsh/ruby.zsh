# -*- sh -*-

# rbenv
if type rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"

    local HOMEBREW_RBENV_PATH="$HOMEBREW_PREFIX/opt/rbenv"
    if [ -f ${HOMEBREW_RBENV_PATH}/completions/rbenv.zsh ]; then
        source ${HOMEBREW_RBENV_PATH}/completions/rbenv.zsh
    fi
else
    echo "A missing package: rbenv"
fi

# bundler
alias be="bundle exec"
alias bs="bundle exec spring"
alias binit="bundle init; bundle install --path vendor/bundle"
