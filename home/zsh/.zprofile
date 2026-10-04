for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  [[ -x $brew_bin ]] && eval "$("$brew_bin" shellenv zsh)" && break
done
unset brew_bin

export JAVA_HOME="$HOMEBREW_PREFIX/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

typeset -U path PATH
path=(
  "$JAVA_HOME/bin"
  "$HOME/.local/bin"
  $path
)
