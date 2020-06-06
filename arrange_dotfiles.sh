#!/bin/bash

## Touches
touch ~/.ssh/config
touch ~/.bashrc

## Moves
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

## Echoes
echo -e "Host *\n\tServerAliveInterval 60" | tee ~/.ssh/config
echo "alias l='ls -lh'" | tee -a ~/.bashrc
echo "alias tt='tmux'" | tee -a ~/.bashrc
echo "alias xx='xdg-open'" | tee -a ~/.bashrc
