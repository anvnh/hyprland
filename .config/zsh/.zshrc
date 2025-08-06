# Zsh configuration for dots-hyprland

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Basic zsh options
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
unsetopt beep

# Key bindings
bindkey -e
bindkey '^H' backward-kill-word 
bindkey '^Z' undo

# Aliases
alias pamcan='pacman'
alias ls='eza --icons'
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias q='qs -c ii'

# Starship prompt
eval "$(starship init zsh)"

# Load dots-hyprland specific configurations
if [[ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]]; then
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

# Source additional zsh configurations
for config_file in ~/.config/zshrc.d/*.zsh; do
    if [[ -f "$config_file" ]]; then
        source "$config_file"
    fi
done 