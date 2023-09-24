#!/bin/bash


if [ ! -f nvim-linux64.tar.gz ] ; then
   wget "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"

fi

if [ ! -f nvim-linux64 ] ; then
   tar xzf nvim-linux64.tar.gz
fi

if [ -d /usr/share/nvim ] ; then
   sudo rm -r /usr/share/nvim -f
fi
sudo cp -r ./nvim-linux64/share/nvim /usr/share


if [ -d /usr/share/nvim ] ; then
   sudo rm -r /usr/lib/nvim -f
fi

sudo cp -r ./nvim-linux64/lib/nvim /usr/lib/

if [ -d /usr/bin/nvim ] ; then
   sudo rm -r /usr/bin/nvim -f
fi
sudo cp  ./nvim-linux64/bin/nvim /usr/bin/



#rm -r ./nvim-linux64.tar.gz -f
#rm -r ./nvim-linux64 -f

