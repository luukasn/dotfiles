# Post installation script
The idea is to create a post installation script which can be ran after a new and fresh system install.
It will
1. Prompt which applications to install via a GUI selector.
2. Install these applications.
3. Do post install configuration and setup.
This is another idea

Add a video idea reference here later...

## Arch linux applications needed

### Window managers

### Different window managers 
`sway` - a drop in placement for i3 but for wayland

### window manager dependencies
`waybar` - a cool bar to combine with sway
`tofi` - a simple application launcher for wayland
`swaybg` - tool to set wallpapers on wayland
`brightnessctl` - tool for controlling laptop screen brightness

### Command line applications:

#### Utilities
`bluetoothctl` - for managing bluetooth connections (for arch the package is **bluez-utils**)
`man-db` - for man page database
`unzip` - for unzipping .zip files
`stow` - for managing dotfiles
`fzf` - command line fuzzy finder
`bat` - for file preview with code highlighting

#### Development stuff
`mongodb` - database
`mongosh` - scriptable cli client for mongodb

#### Application dependencies
`nodejs` - A javascript runtime, required by neovim plugins
`npm` - A nodejs package manager, required by neovim plugins

## Post install configuration and setup
The post install script would install all the apps 
and apply configuration for them. 

It would download nerd fonts and move them to ~/.local/share/fonts/[FontName]/
howto: host the fonts in this dotfiles repo or in a http server.
