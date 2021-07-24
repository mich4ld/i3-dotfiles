# Your i3 config file path:
I3_CONFIG=~/.config/i3/config
I3_CONFIG_BACKUP=~/.config/i3/config.old

# Your local font directory
FONTS_DIR=~/.local/share/fonts/

# My configs directory - DON'T CHANGE:
MY_CONFIG_DIR=~/.config/miszq-dots
cd "$(dirname "$0")"

function prepare_install() {
   mkdir -p $MY_CONFIG_DIR
}

function set_wallpaper() {
    echo "Setting new wallpaper..."
    nitrogen --set-auto ./wallhaven-6kw7kq.jpg
}

function arch_install() {
    echo "Installing packages for Arch"
    sudo pacman -Sy
    sudo pacman -S rofi dunst nitrogen redshift pamixer kitty
}

function debian_install() {
    echo "Installing packages for Debian"
}

function ask_distro() {
    echo "Which distro are you using?"
    echo "1) Arch (Arch, Manjaro)"

    read DISTRO

    if [ $DISTRO -eq 1 ]; then
        arch_install
    fi
}

function install_dependencies() {
    echo "Install dependencies for your distro? (Y/n)"
    read INSTALL_ANSWER

    if [[ $INSTALL_ANSWER = y || $INSTALL_ANSWER = Y ]]; then
        ask_distro
    fi
}

function install_fonts() {
    echo "Installing fonts..."
    mkdir -p $FONTS_DIR
    cp -v ./fonts/* $FONTS_DIR
}

function config_i3() {
    echo "Creating backup for i3 config..."
    cp $I3_CONFIG $I3_CONFIG_BACKUP 

    echo "Configure i3..."
    cp ./i3/config $I3_CONFIG
}

function config_polybar() {
    echo "Configure polybar..."
    mkdir -p "$MY_CONFIG_DIR/polybar"
    cp -v ./polybar/** "$MY_CONFIG_DIR/polybar"
}

function config_rofi() {
    echo "Configure rofi..."
}

# Execute functions:
prepare_install
install_dependencies
set_wallpaper
install_fonts
config_polybar
config_rofi
config_i3
