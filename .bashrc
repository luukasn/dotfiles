#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add directories to PATH:
export PATH="$PATH:$HOME/.local/bin"

# Set neovim as the man pager
export MANPAGER="nvim +Man!"

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

if [ -f "$(which starship)" ]; then
    eval "$(starship init bash)"
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

# Source all the aliases from the alias file
source $HOME/.config/bash/aliases.sh

fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
