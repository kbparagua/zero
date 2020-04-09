#!/bin/sh

if ! [ -d "$HOME/.rbenv" ]; then
  echo "Installing rbenv and ruby"
  sudo apt install autoconf bison build-essential libssl-dev libyaml-dev \
    libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  rbenv install 2.7.1
  rbenv global 2.7.1
fi
