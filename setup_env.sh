#!/usr/bin/env bash

############## Enviorment Setup

PWD=`pwd`

############## vim setup

VIMRC="$HOME/.vim/_vimrc"

rm -rf $HOME/.vim
cp -r $PWD/_vim $HOME/

cat > $HOME/.vimrc << EOF
if filereadable("$VIMRC")
  source $VIMRC
endif
EOF
#
cat > $HOME/.gvimrc << EOF
if filereadable("$VIMRC")
  source $VIMRC
endif
EOF

############ Bash Setup

#rm -rf $HOME/bin
#cp -r $PWD/bin $HOME/

rm -f $HOME/.bashrc 
cp $PWD/_bashrc $HOME/.bashrc
rm -r $HOME/.myENV 
cp -r $PWD/_myENV $HOME/.myENV
rm -f $HOME/.zshrc 
cp $PWD/_zshrc $HOME/.zshrc
# setup bash
if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

# setup bash
#if [ -f $HOME/.zshrc ]; then
#    . $HOME/.zshrc
#fi
