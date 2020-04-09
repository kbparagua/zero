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

# postgresql
if ! [ -x "$(command -v psql)" ]; then
  echo "Installing postgresql"
  sudo -u postgres createuser $(whoami)
  sudo -u postgres createdb $(whoami)
fi

./ruby/setup.sh
./sublime/setup.sh
