#!/bin/sh

if ! [ -x "$(command -v nvm)" ]; then
  git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm
  ( cd $HOME/.nvm ; git checkout v0.35.3 )
  . $HOME/.nvm/nvm.sh
  nvm install --lts

  # Install yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install --no-install-recommends yarn
fi
