link_dotfiles() {
  echo "\nLinking dotfiles with stow..."
  if (( ! ${+commands[stow]} )); then
    echo "ERROR: stow is not installed (run the brew component first)"
    return 1
  fi
  if ! stow -v --no-folding -d "$REPO_DIR" -t "$HOME" zsh; then
    echo "ERROR: stow found existing files in the way (e.g. ~/.zshrc)"
    echo "Move them aside and re-run, or adopt them with: stow --adopt --no-folding -d $REPO_DIR -t $HOME zsh"
    return 1
  fi
}
