# ------------------------------
# Shell
# ------------------------------

alias rm='safe-rm'
alias ll='ls -lah'
alias reload='exec zsh'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# ------------------------------
# uv
# ------------------------------

alias uvi='uv init'
alias uvinw='uv init --no-workspace'
alias uvs='uv sync'
alias uvsu='uv sync --upgrade'
alias uvl='uv lock'
alias uva='uv add'
alias uvrm='uv remove'
alias uvr='uv run'

# ------------------------------
# git
# ------------------------------

alias gcl='git clone --recurse-submodules'

alias gst='git status'

alias grm='git remote'
alias grmv='git remote --verbose'
alias grma='git remote add'
alias grmurl='git remote set-url'

alias gbr='git branch'
alias gbra='git branch --all'
alias gbrd='git branch --delete'
alias gbrD='git branch --delete --force'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'

alias ga='git add'
alias gau='git add --update'
alias gaa='git add --all'

alias gcm='git commit --message'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gd='git diff'
alias gds='git diff --staged'

alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplrv='git pull --rebase -v'
alias gplra='git pull --rebase --autostash'
alias gplrav='git pull --rebase --autostash -v'

alias gf='git fetch'
alias gfo='git fetch origin'

alias gm='git merge'
alias gmff="git merge --ff-only"
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gms="git merge --squash"

alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'

alias grs='git reset'
alias grsh='git reset --hard'
alias grsk='git reset --keep'
alias grss='git reset --soft'
alias grst='git reset --'

alias gstall='git stash --all'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'

alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'
