#!/bin/sh

sudo apt install git vim curl zsh fonts-powerline autoconf bison \

./zsh/setup.sh

# postgresql
if ! [ -x "$(command -v psql)" ]; then
  echo "Installing postgresql"
  sudo -u postgres createuser $(whoami)
  sudo -u postgres createdb $(whoami)
fi

./ruby/setup.sh
./sublime/setup.sh
