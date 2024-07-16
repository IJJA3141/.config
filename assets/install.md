#ll PACKAGES (sujétions)

### OS

wl-clipboard
bluez
bluez-util
brightnessctl
gruvbox-icon-theme
fcitx5
fcitx5-mozc
fcitx5-configtool
pipewire
pipewire-pulse
playerctl
auto-cpufreq
pacman-contrib

#### WM

hyprland-git
hyprland-monitor-attached
xdg-desktop-portal-hyprland-git
hyprshot
pyprland
eww
python-dbus
swww
mpvpaper

#### fonts

[https://github.com/mshioda/relaxed-typing-mono-jp?tab=readme-ov-file](RelaxedTypingMonoJP)
ttf-fantasque-nerd
ttf-firacode-nerd
ttf-icomoon-feather
noto-fonts-emoji
noto-fonts-cjk

### dev

neovim
tree-sitter-cli
python
python-pip
nodejs
npm
lua
luarocks

#### terminal

kitty
man-db
zsh
oh-my-posh
neofetch
onefetch
socat
wget
unzip
wev
openssh
nmap
net-tools

### user app

firefox-developer-edition -> jack-pipewire
github-cli
mpv

#### game

steam -> amdvlk, amdvlklib
minecraft-launcher

# cmd

#### zsh config path

ln -s ~/.config/zsh/.zshenv ~/.zshenv
chmod +x ~/.zshenv

#### mpvplayer 
mpvpaper eDP-1 -o "--speed=0.2 --loop-file=inf"  ~/.config/assets/wallpapers/露台.mp4

#### set-up ssh

ln -s ~/.config/ssh/config ~/.ssh/config
ln -s ~/.config/ssh/authorized_keys ~/.ssh/authorized_keys
echo "\nInclude /home/$(whoami)/.config/ssh/sshd_config"
