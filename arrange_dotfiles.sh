#!/bin/bash

touch ~/.ssh/config
echo "Host *\n\tServerAliveInterval" | sudo tee ~/.ssh/config
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
