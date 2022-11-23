# -*- sh -*-

# go lang
eval "$(goenv init -)"
export PATH="${GOPATH}/bin:$PATH"

# java
export JENV_ROOT="$HOME/.jenv"
if [[ -d "${JENV_ROOT}" ]]; then
  eval "$(jenv init -)"
fi

# Rust
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"

# LLVM
export PATH="$PATH:$HOMEBREW_PREFIX/opt/llvm/bin"

# cabal
export PATH="$PATH:$HOME/.cabal/bin"

# OPAM
export "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null || true
