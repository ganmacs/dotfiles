# -*- sh -*-

# rbenv
if type rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
    source $HOMEBREW_PREFIX/opt/rbenv/completions/rbenv.zsh
else
    echo "A missing package: rbenv"
fi

# bundler
alias be="bundle exec"
alias bs="bundle exec spring"
alias binit="bundle init; bundle install --path vendor/bundle"

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"
