# Write later
# A script which installs all the dependencies

# Import the logging functions
source ./lib/log.sh
source ./lib/utils.sh

arch_linux_full_install_packages=(
    "base-devel" "devtools" "stow" "nodejs" "npm" "fzf"
    "sway" "waybar" "swaybg" "slurp" "grim" "wl-clipboard" 
    "brightnessctl" "ttf-jetbrains-mono-nerd" "neovim" "starship"
    "mako"
)

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    arch_linux_full_install_packages+=("rofi-wayland")   
fi

additional_packages=(
    "linux-lts" "linux-lts-headers"
)

backup_config_recursively "$HOME/dotfiles/"

detect_package_manager
update_system

for package in ${arch_linux_full_install_packages[@]}
do
    install_package "$package"
done

# TODO: prompt the user if they want to install additional packages and 
# if they want to run the ./setup-dotfiles.sh script after this script 
# has been executed
