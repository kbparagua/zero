#!/bin/sh
if ! [ -x "$(command -v google-chrome)" ]; then
  echo "Instlaling google-chrome"
  wget -P $HOME https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install $HOME/google-chrome-stable_current_amd64.deb
  sudo rm $HOME/google-chrome-stable_current_amd64.deb
fi
