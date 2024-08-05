# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/luukas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load the starship prompt:
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/zsh/plugins/starship/config.toml

# Load custom PATH directories
export PATH="${PATH}:/home/luukas/.cargo/bin"

# Custom functions and aliases.
# Function to automatically push changes to git
function acp() {
	git add .
	git commit -m "$1"
	git push $2
}

function config() {
	BASE_CONFIG_PATH="~/.config"
	case "$1" in 
		"nvim")
			cd ~/.config/nvim/
		;;
		"polybar")
			cd ~/.config/polybar
		;;
		*)
			cd ~/.config
		;;
	esac
}

alias nv=nvim

# Open a file with cat and automatically pipe it to less
function readfile() {
	if [ "$#" -eq 0 ] 
	then
		echo "No file was given, please follow this syntax: readfile [path/to/file]"
	else
		if [[ -d $1 ]]
		then
			echo "$1 is a directory"
		else
		cat "$1" | less		
		fi
	fi
}

# Load all the custom plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Read the OpenAI api key from the keys directory and set it.
export OPENAI_API_KEY=$(cat $HOME/dotfiles/keys/OPENAI_API)

export PATH=$HOME/.local/bin:$PATH
