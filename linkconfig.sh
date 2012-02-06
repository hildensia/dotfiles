linkfiles=(X11/Xauthority X11/xinitrc X11/Xresources zsh zsh/zshrc zsh/zshenv vim vim/vimrc mpd mpd/mpdconf gitconfig mozilla)
link_file() {
  ORG="$HOME/.`basename $1`" 
  if [ -f $ORG ]
  then 
    rm $ORG
    echo "remove $ORG";
  fi
  ln -s ".config/$1" $ORG
   
}
for file in "${linkfiles[@]}"; do
  link_file $file 
done

git submodule update --init
mkdir vim/undo # don't track the undo files, but create a dir for them
