#!/usr/bin/env bash
cd ~/.config/nvim
newVimFile="init.vim.old-$(date +%y-%m-%d)"

wget https://raw.githubusercontent.com/TheMagzuz/viminit/main/init.vim -O /tmp/init.vim

changed=0

cmp /tmp/init.vim ~/.config/nvim/init.vim --silent || changed=1

if [ $changed -eq 0 ]; then
  exit
fi

if [ -f $newVimFile ]; then
  i=0
  baseVimFile=$newVimFile.
  newVimFile=$baseVimFile$i
  while [ -f $newVimFile ]; do
    ((i++))
    newVimFile=$baseVimFile$i
  done
fi
if [ -f ~/.config/nvim/init.vim ]; then
  mv ~/.config/nvim/init.vim $newVimFile
fi
mv /tmp/init.vim ~/.config/nvim/init.vim
