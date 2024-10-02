red() {
    echo "\e[31m$1\e[0m"
}

green() {
    echo "\e[32m$1\e[0m"
}

blue() {
    echo "\e[34m$1\e[0m"
}

inf() {
    if [[ $1 && $2 ]]; then
        echo -e "$(blue "$2"): $1"  
    elif [[ $1 ]]; then
        echo -e "$(blue "info"): $1" 
    else
        exit 1
    fi
}

success() {
    if [[ $1 && $2 ]]; then
        echo -e "$(green "$2"): $1"  
    elif [[ $1 ]]; then
        echo -e "$(green "success"): $1" 
    else
        exit 1
    fi
}


err() {
    if [[ $1 && $2 ]]; then
        echo -e "$(red "$2"): $1"  
    elif [[ $1 ]]; then
        echo -e "$(red "error"): $1" 
    else
        exit 1
    fi
}
