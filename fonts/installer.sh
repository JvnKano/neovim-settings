#!/bin/bash


if [ ! -d ~/.fonts ] ; then
   mkdir ~/.fonts
fi


unzip ./DejaVuSansMono.zip

cp *.ttf ~/.fonts




