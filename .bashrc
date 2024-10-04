#
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add directories to PATH:
export PATH="$PATH:$HOME/.local/bin"

# Load API keys:
if [ -f "$HOME/dotfiles/keys/OPENAI_API_KEY" ]; then
    export "OPENAI_API_KEY=$(cat $HOME/dotfiles/keys/OPENAI_API_KEY)"
fi

# Tell atac where the keybindings configuration file is stored at 
export ATAC_KEY_BINDINGS=$HOME/dotfiles/.config/atac/vim_key_bindings.toml

# Set up fzf integration for bash
if [ -f "$(which fzf)" ]; then
    eval "$(fzf --bash)"
fi

if [ -f "$(which tmux)" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# Bash sheet (cheat cheet for moving around the prompt in bash)
bshsh() {
    echo "====== BASH MOVEMENT CHEAT SHEET ======"
    echo "[MOVING AROUND]"
    echo "Alt + F : Move to the right by one word"
    echo "Alt + B : Move to the left by one word"
    echo "Ctrl + A : Move to the start of the prompt"
    echo "Ctrl + E : Move to the end of the prompt"
}

fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
