#!/usr/bin/env bash

# 安装输入法，yay，ob，vs，之类的


# 安装zsh相关

echo "install zsh omyzsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp ./data/.zshrc ~/
source zsh

# 安装字体
cp ./data/KKong3.ttf  /usr/share/fonts/
fc-cache -f -v

# 安装输入法

echo "install fcitx5 and rim"

sudo pacman -S fcitx5-material-color

sudo pacman -S fcitx5-chinese-addons fcitx5 fcitx5-rime fcitx5-gtk fcitx5-qt fcitx5-config-qt

cp ./data/.pam_environment ~/
cp ./data/classicui.conf ~/.config/fcitx5/conf/classicui.conf


# 安装yay
echo "install yay"
sudo pacman -S base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# 安装OB
yay -S obsidian

# 安装chrome
yay -S google-chrome

# 安装VS
yay -S code

# 安装pop-shell
yay -S yay -S gnome-shell-extension-pop-shell-bin

# 安装emcas

sudo pacman -S emacs

# 安装中国软件库
