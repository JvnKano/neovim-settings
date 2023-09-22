#!/bin/bash

if [ ! -d ~/.config] ; then
   mkdir ~/.config
fi

if [ ! -d ~/.config/nvim] ; then
   mkdir ~/.config/nvim
fi


if [ ! -d ~/.config/nvim/lua] ; then
   mkdir ~/.config/nvim/lua
fi

cp ./lua/* ~/.config/nvim/lua/
cp ./init.lua ~/.config/nvim/




