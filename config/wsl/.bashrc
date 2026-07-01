# ArDev Terminal - WSL Bash Config

if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

alias ll='eza -la --icons'
alias la='eza -a --icons'
alias cat='batcat'
alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias gpl='git pull'
alias lg='lazygit'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'