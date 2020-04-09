#!/bin/sh
sudo apt install git

ssh-keygen -t rsa -b 4096 -C "kb.paragua@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "Copy ssh key to github:"
cat ~/.ssh/id_rsa.pub # copy to github
read -p "Press enter to continue"

ssh -T git@github.com # test github connection
git config --global user.email "kb.paragua@gmail.com"
git config --global user.name "kbparagua"
git config --global core.editor vim

