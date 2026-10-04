install_zsh_tooling() {
  local zsh_dir="$HOME/.interactive-zsh/.oh-my-zsh"

  echo "\nInstalling oh-my-zsh..."
  if [[ -d "$zsh_dir" ]]; then
    echo "Already present: $zsh_dir"
  else
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$zsh_dir" || { echo "ERROR: failed to clone oh-my-zsh"; return 1; }
  fi
}
