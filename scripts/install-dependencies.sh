# Write later
# A script which installs all the dependencies

detect_package_manager() {
    for bin in pacman dnf apt
    do
        if [ -f $(which $bin) ]; then
            package_manager=$bin
            echo $bin
        fi
    done
}

detect_package_manager
echo $package_manager

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
