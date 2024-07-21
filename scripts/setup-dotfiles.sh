# Write later
# A script which setups the dotfiles (NOTE: you need to run the install-dependencies script first)

check_bin() {
    which $1 >> /dev/null
    if [[ $? -eq 1 ]]; then
        echo "Binary $1 is required to setup these dotfiles, exiting..."
        exit 1
    fi
}

check_bin "stow"
