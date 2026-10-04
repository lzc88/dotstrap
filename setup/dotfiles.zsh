link_dotfiles() {
  echo "\nLinking dotfiles with stow..."
  if (( ! ${+commands[stow]} )); then
    echo "ERROR: stow is not installed (run the brew component first)"
    return 1
  fi
  if ! (cd "$REPO_DIR/home" && stow -v --no-folding -t "$HOME" *(/)); then
    echo "ERROR: stow found existing files in the way (e.g. ~/.zshrc)"
    echo "Move them aside and re-run, or adopt them with: cd $REPO_DIR/home && stow --adopt <package>"
    return 1
  fi
}
