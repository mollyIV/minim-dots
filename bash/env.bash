if [[ $OSTYPE == darwin* ]]; then
  export OSX=true
fi

# Set the path to include:
#  - $HOME/.bin       for local tools
#  - $HOME/.local/bin for haskell tools installed by stack
#  - $BREW_PREFIX/bin for Homebrew on Apple Silicon, or duplicates the /usr/local/bin path
#  - /usr/local/bin
#  - /usr/local/sbin
#  - /usr/bin         for system executables
#  - /usr/sbin
#  - /bin
#  - /sbin
export PATH="$HOME/.bin:$HOME/.local/bin:$BREW_PREFIX/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export CDPATH=$HOME/dev/mnf:$HOME/dev/lyft:$HOME/dev:$HOME/go/src/github.com/lyft:$HOME/go/src/github.com/bazelbuild

export EDITOR="code -w"

# Source something from all shells for private ENV vars
if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi

export PIP_DISABLE_PIP_VERSION_CHECK=1

# Swift compiler sccache setup
export SCCACHE_CACHE_SIZE=100G
export SWIFT_USE_SCCACHE=1

export GIT_PILE_PREFIX=ks/
export GIT_PILE_VERBOSE=true
