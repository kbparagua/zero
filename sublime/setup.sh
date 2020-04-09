#!/bin/sh

if ! [ -f "/opt/sublime_text/sublime_text" ]; then
  echo "Installing Sublime Text 3"

  SUBLIME_ZERO_DIR=$HOME/zero/sublime/
  SUBLIME_HOME_DIR=$HOME/.config/sublime-text-3/
  SUBLIME_INSTALLED_PACKAGES_DIR="$SUBLIME_HOME_DIR/Installed Packages"
  SUBLIME_USER_DIR=$SUBLIME_HOME_DIR/Packages/User/

  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt install sublime-text

  echo "Installing Package Control"
  wget -P "$SUBLIME_INSTALLED_PACKAGES_DIR" https://packagecontrol.io/Package%20Control.sublime-package


  echo "Copying Sublime Text settings"
  if ! [ -d "$SUBLIME_USER_DIR" ]; then
    mkdir -p $SUBLIME_USER_DIR
  fi

  ln -s $SUBLIME_ZERO_DIR/Default.sublime-keymap $SUBLIME_USER_DIR/Default.sublime-keymap
  ln -s $SUBLIME_ZERO_DIR/Preferences.sublime-settings $SUBLIME_USER_DIR/Preferences.sublime-settings
  ln -s $SUBLIME_ZERO_DIR/Package\ Control.sublime-settings $SUBLIME_USER_DIR/Package\ Control.sublime-settings
fi
