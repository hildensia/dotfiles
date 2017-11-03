#!/bin/bash

linkfiles=(X11/Xauthority X11/xinitrc X11/Xresources zsh zsh/zshrc zsh/zshenv vim vim/vimrc mpd mpd/mpdconf gitconfig gdb/gdbinit tmux.conf zim zimrc zlogin)
link_file() {
  ORG="$HOME/.`basename $1`" 
  if [ -f $ORG ]
  then 
    mv $ORG $ORG.save
    echo "saved $ORG as $ORG.save";
  fi
  ln -s ".config/$1" $ORG
   
}
for file in "${linkfiles[@]}"; do
  link_file $file 
done

git submodule update --init  # get vundle
mkdir vim/undo # don't track the undo files, but create a dir for them
mkdir vim/swap # don't track the undo files, but create a dir for them
