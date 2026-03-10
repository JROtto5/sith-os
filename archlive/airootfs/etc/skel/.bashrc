#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Themed man pages
if command -v bat &>/dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi

# ── ALIASES ──────────────────────────────────────
alias ls='eza --icons --color=always'
alias ll='eza -lah --icons --color=always --git'
alias la='eza -a --icons --color=always'
alias lt='eza --tree --level=2 --icons'
alias grep='grep --color=auto'
alias cat='bat --paging=never --style=plain'
alias catn='/usr/bin/cat'
alias du='dust'
alias find='fd'
alias lg='lazygit'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'
alias gco='git checkout'
alias gbr='git branch'
alias dc='docker compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias cls='clear'
alias ports='ss -tlnp'
alias myip='curl -s ifconfig.me'
alias gpu='command -v nvidia-smi &>/dev/null && nvidia-smi || echo "No NVIDIA GPU detected"'
alias gpuw='command -v nvidia-smi &>/dev/null && watch -n 1 nvidia-smi || echo "No NVIDIA GPU detected"'
alias top5='ps aux --sort=-%cpu | head -6'
alias mem='free -h'
alias weather='curl -s wttr.in?format=3'
alias ld='command -v lazydocker &>/dev/null && lazydocker || echo "Install lazydocker: paru -S lazydocker"'
alias y='yazi'
alias sith-rain='cmatrix -C red -a -B -u 3'
alias sith-pipes='command -v pipes.sh &>/dev/null && pipes.sh -c 1 -c 5 -c 4 -p 5 -t 2 -R -f 60 || echo "Install pipes.sh from AUR: paru -S pipes.sh"'
alias sith-lightning='command -v pipes.sh &>/dev/null && pipes.sh -c 1 -c 5 -p 8 -t 0 -f 100 -s 5 || echo "Install pipes.sh from AUR: paru -S pipes.sh"'

# ── FUNCTIONS ────────────────────────────────────
# Quick project directory jump
proj() { cd ~/Projects/"$1" 2>/dev/null || cd ~/projects/"$1" 2>/dev/null || echo "Project not found"; }

# Extract anything
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.tar.xz)  tar xJf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "Can't extract '$1'" ;;
        esac
    else
        echo "'$1' is not a file"
    fi
}

# Quick serve current dir
serve() { python -m http.server "${1:-8000}"; }

# ── FZF ──────────────────────────────────────────
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--color=bg+:#1a0535,fg:#e6dcff,fg+:#00ffc8,hl:#b400ff,hl+:#00ffc8,info:#8c64a0,prompt:#b400ff,pointer:#ff0033,marker:#ff0033,spinner:#b400ff,header:#8c64a0"
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ── ZOXIDE ─────────────────────────────────────────
eval "$(zoxide init bash)"

# ── STARSHIP PROMPT ──────────────────────────────
eval "$(starship init bash)"

# ── SITH QUOTES ──────────────────────────────────
SITH_QUOTES=(
    "Peace is a lie, there is only passion."
    "Through passion, I gain strength."
    "Through strength, I gain power."
    "Through power, I gain victory."
    "Through victory, my chains are broken."
    "The Force shall free me."
    "I am the Dark Side."
    "There is no peace, there is anger."
    "There is no fear, there is power."
    "The dark side of the Force is a pathway to many abilities some consider to be unnatural."
    "Power! Unlimited power!"
    "Let the hate flow through you."
    "Once you start down the dark path, forever will it dominate your destiny."
    "The Sith code is etched in blood and fire."
)

# ── TERMINAL LAUNCH ──────────────────────────────
if [ -z "$FASTFETCH_SHOWN" ]; then
    export FASTFETCH_SHOWN=1
    if command -v toilet &>/dev/null; then
        echo ""
        echo -e "\033[38;2;140;100;160m  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        toilet -f bigmono12 -F metal "  SITH"
        echo -e "\033[38;2;140;100;160m  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        RANDOM_QUOTE="${SITH_QUOTES[$((RANDOM % ${#SITH_QUOTES[@]}))]}"
        echo -e "  \033[1;31m>>>\033[0m \033[3;38;2;255;50;80m${RANDOM_QUOTE}\033[0m"
        echo ""
    fi
    fastfetch
fi

export PATH="$HOME/.local/bin:$PATH"
