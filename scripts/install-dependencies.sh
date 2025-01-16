# Write later
# A script which installs all the dependencies

# Import the logging functions
source ./lib/log.sh
source ./lib/utils.sh

arch_linux_full_install_packages=(
    "base-devel" "devtools" "stow" "nodejs" "npm" "fzf"
    "sway" "waybar" "swaybg" "slurp" "grim" "wl-clipboard" 
    "brightnessctl" "ttf-jetbrains-mono-nerd" "neovim" "starship"
    "mako" "papirus-icon-theme" "lazygit"
)

arch_linux_headless_packages=(
    "base-devel" "devtools" "stow" "nodejs" "npm" "fzf"
    "ttf-jetbrains-mono-nerd" "neovim" "starship" "lazygit"
)

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    arch_linux_full_install_packages+=("rofi-wayland")   
fi

additional_packages=(
    "linux-lts" "linux-lts-headers" )

# backup_config_recursively "$HOME/dotfiles/"

detect_package_manager
update_system

echo "You can choose to install full install or headless install"
inf "installs everything" "    full"
inf "installs only the productivity tools, but not the desktop environment. choose this if you already have a desktop environment, but want the tools." "    headless"
prompt "Do you want to install full or headless install (full/headless): " install_type

if [[ "$install_type" == "full" ]]; then
	for package in ${arch_linux_full_install_packages[@]}
	do
	    install_package "$package"
	done
elif [[ "$install_type" == "headless" ]]; then
	for package in ${arch_linux_headless_packages[@]}
	do
	    install_package "$package"
	done
else
	err "invalid install type, exiting..."
	exit 1
fi

# TODO: prompt the user if they want to install additional packages and 
# if they want to run the ./setup-dotfiles.sh script after this script 
# has been executed

success "dependencies installed succesfully"
