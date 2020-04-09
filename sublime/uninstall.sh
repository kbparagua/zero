#!/bin/sh
sudo apt remove -y sublime-text
sudo apt autoremove sublime-text
rm -R $HOME/.config/sublime-text-3/
