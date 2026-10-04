find_brew() {
  local brew_bin
  for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    [[ -x "$brew_bin" ]] && { echo "$brew_bin"; return 0; }
  done
  return 1
}

ensure_homebrew() {
  local brew_bin

  if ! brew_bin=$(find_brew); then
    echo "\nInstalling Homebrew (also installs Xcode Command Line Tools)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || return 1
    brew_bin=$(find_brew) || { echo "ERROR: brew not found after install"; return 1; }
  fi

  eval "$("$brew_bin" shellenv zsh)"
}

install_or_update_all_apps() {
  if [[ ! -f "$BREWFILE" ]]; then
    echo "ERROR: $BREWFILE does not exist!"
    return 1
  fi

  local -a taps=(${(f)"$(awk -F'"' '/^tap "/ {print $2}' "$BREWFILE")"})

  echo "\nUpdating Homebrew and installing/updating all apps..."
  brew update
  (( ${#taps} )) && brew trust --tap "${taps[@]}"
  brew bundle install --file="$BREWFILE"
}
