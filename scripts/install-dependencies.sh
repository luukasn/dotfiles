# Write later
# A script which installs all the dependencies

minimal_install_packages="stow gcc neovim nodejs npm fzf"
full_install_packages="stow neovim nodejs npm fzf gcc"

# Function to detect which package managers are present on the current system
detect_package_manager() {
    for bin in pacman dnf apt
    do
        if [ -f $(which $bin) ]; then
            package_manager=$bin
            break
        fi
    done
}

# Function to install a package on a package manager x
install_package() {
    package=$1

    case "$package_manager" in
        "pacman")
            sudo pacman -S $package
        ;;
        "dnf")
            sudo dnf install $package
        ;;
        "apt")
            sudo apt isntall $package
        ;;
    esac
}

detect_package_manager

echo "sudo pacman -S $minimal_install_packages"
