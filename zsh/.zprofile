eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"

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
