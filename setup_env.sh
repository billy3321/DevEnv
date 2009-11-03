#!/usr/bin/env bash

############## Enviorment Setup

PWD=`pwd`

############## vim setup

VIMRC="$HOME/.vim/_vimrc"

rm -rf $HOME/.vim
cp -r $PWD/.vim $HOME/

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
cp $PWD/.bashrc $HOME
cp -r $PWD/.myBashSetting $HOME

# setup bash
if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi
