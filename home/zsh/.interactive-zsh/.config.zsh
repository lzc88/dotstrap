export ZSH="$HOME/.interactive-zsh/.oh-my-zsh"

zstyle ':omz:update' mode reminder

mkdir -p "$HOME/.cache/zsh"
ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

HISTFILE="$HOME/.interactive-zsh/.zsh_history"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

[[ -f "$ZSH/oh-my-zsh.sh" ]] \
&& source "$ZSH/oh-my-zsh.sh"

[[ -f "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme" ]] \
&& source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

POWERLEVEL9K_CONFIG_FILE="$HOME/.interactive-zsh/.p10k.zsh"
[[ -f "$POWERLEVEL9K_CONFIG_FILE" ]] \
&& source "$POWERLEVEL9K_CONFIG_FILE"

[[ -f "$HOME/.interactive-zsh/.aliases.zsh" ]] \
&& source "$HOME/.interactive-zsh/.aliases.zsh"

[[ -f "$HOME/.interactive-zsh/.functions.zsh" ]] \
&& source "$HOME/.interactive-zsh/.functions.zsh"

[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
&& source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
&& source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"