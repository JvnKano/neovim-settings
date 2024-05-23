#!/bin/bash

if [ ! -d ~/.fonts ] ; then
   mkdir ~/.fonts
fi

if !(unzip ./DejaVuSansMono.zip > /dev/null 2>&1); then
   sudo apt update -y
   sudo apt -y install unzip
   unzip ./DejaVuSansMono.zip > /dev/null
fi

cp *.ttf ~/.fonts




