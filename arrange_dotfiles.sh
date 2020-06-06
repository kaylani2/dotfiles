#!/bin/bash

touch ~/.ssh/config
echo "Host *\n\tServerAliveInterval" | sudo tee ~/.ssh/config
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
touch ~/.bashrc
echo "alias l='ls -lh'" | sudo tee -a ~/.bashrc
echo "alias tt='tmux'" | sudo tee -a ~/.bashrc
echo "alias xx='xdg-open'" | sudo tee -a ~/.bashrc
