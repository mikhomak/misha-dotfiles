#!/usr/bin/env bash

echo "installing symlinks"
echo "Current directory - ${PWD}"
BASEDIR=${PWD}
echo "Starting installation...."
echo "-------"


echo "Installing vim..."
ln -s -f $BASEDIR/.vimrc $HOME/.vimrc
(test -f $HOME/.vimrc && echo "Vimrc is installed ✅") || echo "Vimrc is not installed!❌"
echo "-------"

echo "Installing zsh..."
ln -s -f $BASEDIR/.zshrc $HOME/.zshrc
echo "export MISHA=$BASEDIR" > $HOME/.zshenv
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
mkdir -p $HOME/.config/imgs
ln -s -f $BASEDIR/imgs/* $HOME/.config/imgs/
(test -d $HOME/.config/imgs && echo "Images are installed ✅") || echo "Images are not installed!❌"
echo "-------"



echo "Installing wezTerm..."
ln -s -f $BASEDIR/.wezterm.lua $HOME/.wezterm.lua
(test -f $HOME/.wezterm.lua && echo "wezterm is installed ✅") || echo "Wezterm is not installed!❌"
echo "-------"


echo "Installing kitty..."
ln -s -f $BASEDIR/kitty.conf $HOME/.config/kitty/kitty.conf
(test -f $HOME/.config/kitty/kitty.conf && echo "Kitty is installed ✅") || echo "Kitty is not installed!❌"
echo "-------"


echo "Installing sketchybar..."
ln -s -f $BASEDIR/sketchybarrc $HOME/.config/sketchybar/sketchybarrc
(test -f $HOME/.config/sketchybar/sketchybarrc && echo "Sketchybar is installed ✅") || echo "Sketchybar is not installed!❌"
echo "-------"


echo "Installing sketchybar plugins..."
ln -s -f $BASEDIR/sketchybar/plugins/*.sh $HOME/.config/sketchybar/plugins
(test -d $HOME/.config/sketchybar/plugins && echo "Sketchybar plugins is installed ✅") || echo "Sketchybar plugins is not installed!❌"
echo "-------"

echo "Installing borders..."
ln -s -f $BASEDIR/bordersrc $HOME/.config/borders/bordersrc
(test -f $HOME/.config/borders/bordersrc && echo "Borders is installed ✅") || echo "Borders is not installed!❌"
echo "-------"



