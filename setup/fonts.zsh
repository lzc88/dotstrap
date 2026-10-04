install_fonts() {
  local font_dir="$HOME/Library/Fonts"
  local base_url="https://github.com/romkatv/powerlevel10k-media/raw/master"
  local style file rc=0

  echo "\nInstalling MesloLGS NF (Powerlevel10k font)..."
  mkdir -p "$font_dir"
  for style in Regular Bold Italic "Bold Italic"; do
    file="MesloLGS NF $style.ttf"
    if [[ -f "$font_dir/$file" ]]; then
      echo "Already present: $file"
    elif curl -fsSL "$base_url/${file// /%20}" -o "$font_dir/$file.part"; then
      mv "$font_dir/$file.part" "$font_dir/$file"
    else
      rm -f "$font_dir/$file.part"
      echo "ERROR: failed to download $file"
      rc=1
    fi
  done
  return $rc
}
