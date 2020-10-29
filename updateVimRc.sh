#!/usr/bin/env bash
cd ~/.config/nvim
newVimFile="init.vim.old-$(date +%y-%m-%d)"

if [ -f $newVimFile ]; then
  i=0
  baseVimFile=$newVimFile.
  newVimFile=$baseVimFile$i
  while [ -f $newVimFile ]; do
    ((i++))
    newVimFile=$baseVimFile$i
  done
fi
mv init.vim $newVimFile
wget https://raw.githubusercontent.com/TheMagzuz/viminit/main/init.vim
