#!/bin/sh

if ! [ -x "$(command -v nvm)" ]; then
  git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm
  ( cd $HOME/.nvm ; git checkout v0.35.3 )
  . $HOME/.nvm/nvm.sh
  nvm install --lts
fi
