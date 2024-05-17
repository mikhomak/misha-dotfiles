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


echo "Installing kitty..."
ln -s -f $BASEDIR/kitty.conf $HOME/.config/kitty/kitty.conf
(test -f $HOME/.config/kitty/kitty.conf && echo "Kitty is installed ✅") || echo "Kitty is not installed!❌"
echo "-------"


