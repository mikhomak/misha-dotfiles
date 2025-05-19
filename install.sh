#!/bin/sh

echo "Current directory - ${PWD}"
BASEDIR=${PWD}
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Git;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Maching that is running is [$machine]"
echo "Starting installation...."


echo "-----------------------------------------------------------------------------"
echo "Creating directories"
echo "-----------------------------------------------------------------------------"

mkdir -p ~/projects ~/work ~/Downloads ~/.ssh ~/.config 
echo "$HOME"
echo "----$HOME/projects"
echo "----$HOME/work"
echo "----$HOME/Downloads"
echo "----$HOME/.ssh"
echo "----$HOME/.config"
echo "-------"

echo "-----------------------------------------------------------------------------"
echo "installing symlinks for dotfiles"
echo "-----------------------------------------------------------------------------"


echo "Please choose the vim instalation [.vimrc] (V)/(v), [nvim] (N)/(n), [all] (A)/(a)"
read vim_setting
case $vim_setting in
	'V'|'v')
		echo "Installing .vimrc"
		ln -s -f $BASEDIR/.vimrc $HOME/.vimrc
	;;
	'N'|'n')
		echo "Installing nvim lua config"
		ln -s -f $BASEDIR/nvim $HOME/.config/
	;;
	'A'|'a')
		echo "Install .vimrc AND nvim lua config"
		ln -s -f $BASEDIR/.vimrc $HOME/.vimrc
		ln -s -f $BASEDIR/nvim $HOME/.config/
	;;
	*)
		echo "Installing .vimrc by default"
		ln -s -f $BASEDIR/.vimrc $HOME/.vimrc
	;;
esac


echo "Installing zsh..."
ln -s -f $BASEDIR/.zshrc $HOME/.zshrc
if  ! grep -q "export MISHA" $HOME/.zshenv; then
	echo "Setting MISHA var in $HOME/.zshenv"
	echo "export MISHA=$BASEDIR" >> $HOME/.zshenv
fi
(test -f $HOME/.zshrc && echo "Zshrc is installed ✅") || echo "zshrc is not installed!❌"
echo "-------"


echo "Installing p10k..."
ln -s -f $BASEDIR/.p10k.zsh $HOME/.p10k.zsh
(test -f $HOME/.p10k.zsh && echo "P10K is installed ✅") || echo "P10K is not installed!❌"
echo "-------"


echo "Installing common colours..."
ln -s -f $BASEDIR/.colors $HOME/.config/.colors
(test -f $HOME/.config/.colors && echo "Colors is installed ✅") || echo "Colors is not installed!❌"
echo "-------"

echo "Installing common images..."
ln -s -f $BASEDIR/imgs $HOME/.config/
(test -d $HOME/.config/imgs && echo "Images are installed ✅") || echo "Images are not installed!❌"
echo "-------"

echo "Installing wallpapers..."
ln -s -f $BASEDIR/wallpapers $HOME/.config/
(test -d $HOME/.config/wallpapers && echo "Wallpapers are installed ✅") || echo "Wallpapers are not installed!❌"
echo "-------"

echo "Installing discord..."
ln -s -f $BASEDIR/discord/settings.json $HOME/.config/discord/settings.json
(test -f $HOME/.config/discord/settings.json && echo "Discord is installed ✅") || echo "discord is not installed!❌"
echo "-------"



echo "Installing terminalls!!!! Yay!"
echo "-------"

echo "Installing wezTerm..."
ln -s -f $BASEDIR/.wezterm.lua $HOME/.wezterm.lua
(test -f $HOME/.wezterm.lua && echo "wezterm is installed ✅") || echo "Wezterm is not installed!❌"
echo "-------"


echo "Installing kitty..."
if [ -d $HOME/.config/kitty ]; 
then
 ln -s -f $BASEDIR/kitty.conf $HOME/.config/kitty/kitty.conf
(test -f $HOME/.config/kitty/kitty.conf && echo "Kitty is installed ✅") || echo "Kitty is not installed!❌"
else
	echo "did you install kitty?"
fi
echo "-------"

if [ "$machine" = "Mac" ]; then

echo "Installing sketchybar..."
echo "Please choose the theme [win98] (W)/(w), [cute] (C)/(c)"
read theme
case $theme in
	'win98'|'W'|'w')
		echo "Installing win98 theme"
		ln -s -f $BASEDIR/mac/sketchybarrc_win98 $HOME/.config/sketchybar/sketchybarrc
	;;
	'cute'|'c'|'C')
		ln -s -f $BASEDIR/mac/sketchybarrc_cute $HOME/.config/sketchybar/sketchybarrc
	;;
	*)
		ln -s -f $BASEDIR/mac/sketchybarrc $HOME/.config/sketchybar/sketchybarrc
	;;
esac
(test -f $HOME/.config/sketchybar/sketchybarrc && echo "Sketchybar is installed ✅") || echo "Sketchybar is not installed!❌"
echo "-------"


echo "Installing sketchybar plugins..."
ln -s -f $BASEDIR/mac/sketchybar/plugins/* $HOME/.config/sketchybar/plugins
(test -d $HOME/.config/sketchybar/plugins && echo "Sketchybar plugins is installed ✅") || echo "Sketchybar plugins is not installed!❌"
echo "-------"

echo "Installing borders..."
ln -s -f $BASEDIR/mac/bordersrc $HOME/.config/borders/bordersrc
(test -f $HOME/.config/borders/bordersrc && echo "Borders is installed ✅") || echo "Borders is not installed!❌"
echo "-------"

echo "Installing yabai..."
if [ -d $HOME/.config/yabai ];
then
	echo "all good"
else
	mkdir $HOME/.config/yabai 
fi
ln -s -f $BASEDIR/mac/yabairc $HOME/.config/yabai/yabairc
(test -f $HOME/.config/yabai/yabairc && echo "Yabai is installed ✅") || echo "Yabai is not installed!❌"
echo "-------"

echo "Installing SKHD..."
ln -s -f $BASEDIR/mac/.skhdrc $HOME/.skhdrc
(test -f $HOME/.skhdrc && echo "SKHD is installed ✅") || echo "SKHD is not installed!❌"
echo "-------"

fi

if [ "$machine" = "Linux" ]; then
	echo "Installing Hyprland..."
	rm -rf $HOME/.config/hypr
	ln -snf $BASEDIR/linux/hypr $HOME/.config/
	(test -d $HOME/.config/hypr && echo "Hyperland is installed ✅") || echo "Hyperland is not installed!❌"
	echo "-------"

	echo "Installing Waybar..."
	ln -snf $BASEDIR/linux/waybar $HOME/.config/
	(test -d $HOME/.config/waybar && echo "Waybar is installed ✅") || echo "Waybar is not installed!❌"
	echo "-------"

fi
