function zsh-show(){
  cat "$HOME/.interactive-zsh/.aliases.zsh"
}

function brews()
{
  emulate -L zsh
  local repo="$HOME/.dotfiles"

  "$repo/bootstrap.zsh" brew || return 1

  print -- "\n--- Removing old versions and cached downloads ---"
  brew cleanup

  print -- "\n--- Installed but not in Brewfile ---"
  if brew bundle cleanup --file="$repo/Brewfile"; then
    print "(none, everything matches the Brewfile)"
  else
    print "Add them to the Brewfile, or uninstall them with: brew bundle cleanup --force --file=$repo/Brewfile"
    return 1
  fi
}

function daily-summary()
{
  emulate -L zsh
  zmodload -F zsh/datetime p:EPOCHSECONDS

  print "=== Daily Dev Summary: $(date '+%A, %B %d %Y') ==="
  print

  print -- "--- Git Activity (today) ---"
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local commits
    commits=$(git log --all --since=midnight --oneline --author="$(git config user.email)")
    print -- "${commits:-(no commits today)}"
  else
    print "(not a git repo)"
  fi
  print

  print -- "--- System ---"
  local boot=$(sysctl -n kern.boottime | awk '{print $4}' | tr -d ,)
  local up=$(( EPOCHSECONDS - boot ))
  printf "Uptime: %dd %dh %dm\n" $(( up / 86400 )) $(( up % 86400 / 3600 )) $(( up % 3600 / 60 ))

  print "CPU:    $(top -l 2 -n 0 -s 1 | awk '/CPU usage/ {idle = $7} END {printf "%.1f%% used", 100 - idle}')"

  local total=$(sysctl -n hw.memsize)
  print "Memory: $(vm_stat | awk -v total="$total" '
    /page size of/ {page = $8}
    /Pages active/ || /Pages wired down/ || /occupied by compressor/ {used += $NF}
    END {printf "%.1fG/%.1fG", used * page / 2^30, total / 2^30}')"

  print "Disk:   $(df -h /System/Volumes/Data | awk 'NR==2 {print $3"/"$2" ("$5" used)"}')"
  print

  print -- "--- Listening Ports ---"
  local ports=$(lsof +c 0 -nP -iTCP -sTCP:LISTEN -F cn 2>/dev/null \
    | awk '/^c/ {cmd = substr($0, 2)} /^n/ {print substr($0, 2) "\t" cmd}' | sort -u)
  print -- "${ports:-(none)}"
}
