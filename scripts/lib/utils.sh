detect_display_server() {
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        echo $XDG_SESSION_TYPE
    elif [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
        echo $XDG_SESSION_TYPE
    else
        echo "unknown"
    fi
}

backup_config_recursively() {
    ignored_files=("." ".." ".git" ".gitignore")
    if [[ ! $1 ]]; then
        echo "Invalid usage of backup, expected one param"
        exit 1
    fi

    file_path=$(realpath $1)
    for file in $(ls -a "$file_path")
    do
        if [[ ${ignored_files[@]} =~ $file ]]; then
            echo "Ignored file $file found, skipping..."
            continue
        fi

        if [[ -d "$(realpath $file)" ]]; then
            echo "target $file is a dir"
        else
            echo "curr_file: $file"
        fi
    done
    
}

prompt() {
    if [[ ! $1 && ! $2 ]]; then
        echo "Invalid usage of prompt, expected two params"
        exit 1
    fi
    read -p "$1" $2
}

# Yes No Prompt
ynprompt() {
    if [[ ! $1 && ! $2 ]]; then
        echo "Invalid usage of prompt, expected two params"
        exit 1
    fi

    while [[ true ]]; do
        prompt "$1" prompt_res
        if [[ "$prompt_res" == "y" || "$prompt_res" == "Y" || "$prompt_res" == "\n" ]]; then
            echo "y" 
            break  
        elif [[ "$prompt_res" == "n" || "$prompt_res" == "N" ]]; then
            echo "n"
            break  
        fi
    done
}

# Function to detect which package managers are present on the current system
detect_package_manager() {
    for bin in pacman dnf apt
    do
        if [ -f $(which $bin) ]; then
            package_manager=$bin
            inf "detected package manager: $bin"
            break
        fi
    done
}

update_system() {
    inf "updating the system, this could take a while..."
    if sudo pacman -Syu --noconfirm 1> /dev/null 2>> install_errors.log ; then
        success "system updated!"
    else 
        err "something went wrong while updating the system, see install_errors.log"
    fi
}

# Function to install a package on a package manager x
install_package() {
    package=$1

    case "$package_manager" in
        "pacman")
            # Install packages, print as minimal output as possible, 
            # do not ask for confirmation messages,
            # redirect all output to /dev/null
            if pacman -Q $package --quiet &> /dev/null ; then
                inf "package $package already installed, skipping..."
            else
                if sudo pacman -S $package --noconfirm 1> /dev/null 2>> install_errors.log; then
                    success "package $package installed succesfully"
                else
                    err "something went wrong while installing $package, see install_errors.log"
                fi
            fi    
        ;;
        "dnf")
            sudo dnf install $package
        ;;
        "apt")
            sudo apt isntall $package
        ;;
        *)
            err "could not detect package manager, exiting..."
            exit 1
        ;;
    esac
}
