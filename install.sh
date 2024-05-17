#!/usr/bin/env bash

echo "installing symlinks"
echo "Current directory - ${PWD}"
BASEDIR=${PWD}

echo "Installing vim..."
ln -s -f $BASEDIR/.vimrc $HOME/.vimrc


echo "Installing zsh..."
ln -s -f $BASEDIR/.zshrc $HOME/.zshrc
echo "export MISHA=$BASEDIR" > $HOME/.zshenv
(ls $HOME/.zshrc && echo "Zshrc is installed") || echo "Zshrc is not installed!"

echo "Installing p10k..."
ln -s -f $BASEDIR/.p10k.zsh $HOME/.p10k.zsh

echo "Installing kitty..."
ln -s -f $BASEDIR/kitty.conf $HOME/.config/kitty/kitty.conf
