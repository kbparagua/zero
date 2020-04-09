#!/bin/sh
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing zsh"
  sudo apt install zsh fonts-powerline
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  chsh -s $(which zsh)
  sudo rm -R $HOME/.zshrc
  ln -s $HOME/zero/zsh/.zshrc $HOME/.zshrc
fi
