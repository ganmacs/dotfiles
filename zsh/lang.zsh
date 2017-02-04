# -*- sh -*-

# Go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# Rust
source $HOME/.cargo/env

# LLVM
export PATH="$PATH:$HOMEBREW_PREFIX/llvm/bin"

# cabal
export PATH="$PATH:$HOME/.cabal/bin"

# OPAM
export "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null || true
