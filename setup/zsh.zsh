clone_if_missing() {
  local repo=$1 dest=$2
  if [[ -d "$dest" ]]; then
    echo "Already present: $dest"
  else
    git clone --depth=1 "$repo" "$dest" || { echo "ERROR: failed to clone $repo"; return 1; }
  fi
}

install_zsh_tooling() {
  local zsh_dir="$HOME/.interactive-zsh/.oh-my-zsh"

  echo "\nInstalling oh-my-zsh and plugins..."
  clone_if_missing https://github.com/ohmyzsh/ohmyzsh.git "$zsh_dir" &&
    clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$zsh_dir/custom/plugins/zsh-autosuggestions" &&
    clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$zsh_dir/custom/plugins/zsh-syntax-highlighting"
}
