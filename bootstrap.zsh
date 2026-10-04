#!/bin/zsh

SCRIPT_NAME="${0:t}"
REPO_DIR="${0:A:h}"
BREWFILE="$REPO_DIR/Brewfile"

COMPONENTS=(brew zsh fonts dotfiles)
typeset -a selected

usage() {
  echo "Usage: $SCRIPT_NAME [component...]"
  echo "Components (default: all, run in this order): ${COMPONENTS[*]}"
}

for arg in "$@"; do
  case "$arg" in
    -h|--help) usage; exit 0 ;;
    *)
      if (( ! ${COMPONENTS[(Ie)$arg]} )); then
        echo "ERROR: unknown component: $arg"
        usage
        exit 1
      fi
      selected+=("$arg")
      ;;
  esac
done
(( ${#selected} )) || selected=($COMPONENTS)

for component in "$REPO_DIR"/setup/*.zsh; do
  source "$component"
done

wants() { (( ${selected[(Ie)$1]} )) }

echo "######################"
echo "###     SET UP     ###"
echo "######################"

ensure_homebrew || { echo "ERROR: Homebrew is required"; exit 1; }
if wants brew; then
  install_or_update_all_apps || { echo "\nERROR: Fix the problems above and re-run"; exit 1; }
fi
if wants zsh; then
  install_zsh_tooling || { echo "\nERROR: oh-my-zsh setup failed"; exit 1; }
fi
if wants fonts; then
  install_fonts || fonts_failed=true
fi
if wants dotfiles; then
  link_dotfiles || exit 1
fi
if [[ -n $fonts_failed ]]; then
  echo "\nERROR: some fonts failed to download, re-run to retry"
  exit 1
fi
