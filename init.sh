#!/bin/sh

sudo apt install git vim curl zsh fonts-powerline autoconf bison \
  build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
  libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
  postgresql postgresql-contrib

# oh-my-zsh
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  chsh -s $(which zsh)
fi

# rbenv and ruby
if ! [ -d "$HOME/.rbenv" ]; then
  echo "Installing rbenv and ruby"
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  rbenv install 2.7.1
  rbenv global 2.7.1
fi

# postgresql
if ! [ -x "$(command -v psql)" ]; then
  echo "Installing postgresql"
  sudo -u postgres createuser $(whoami)
  sudo -u postgres createdb $(whoami)
fi

# sublime text 3
if ! [ -f "/opt/sublime_text/sublime_text" ]; then
  echo "Installing sublime text"
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update && sudo apt install sublime-text

  wget -P $HOME/.config/sublime-text-3/Installed\ Packages https://packagecontrol.io/Package%20Control.sublime-package

  if ! [ -d "$HOME/.config/sublime-text-3/Packages/User" ]; then
    mkdir -p $HOME/.config/sublime-text-3/Packages/User/
  fi

  ln -s $HOME/zero/sublime/Default.sublime-keymap $HOME/.config/sublime-text-3/Packages/User/Default.sublime-keymap
  ln -s $HOME/zero/sublime/Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  ln -s $HOME/zero/sublime/Package\ Control.sublime-settings $HOME/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
fi

