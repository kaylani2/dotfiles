#!/bin/bash
### K: Quick config

## Touches
touch ~/.ssh/config
touch ~/.bashrc
touch ~/.profile

## Moves
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

## Echoes
echo -e "Host *\n\tServerAliveInterval 60" | tee ~/.ssh/config

echo "alias l='ls -lh'" | tee -a ~/.bashrc
echo "alias tt='tmux'" | tee -a ~/.bashrc
echo "alias xx='xdg-open'" | tee -a ~/.bashrc
echo "alias teelog='tee logfile.$(date +'%Y-%m-%d-%H_%M_%S').log'"
echo "stty ixany" | tee -a ~/.bashrc

echo 'if [ -n "$BASH_VERSION" ]; then' | tee -a ~/.profile
echo '# include .bashrc if it exists' | tee -a ~/.profile
echo 'if [ -f "$HOME/.bashrc" ]; then' | tee -a ~/.profile
echo '. "$HOME/.bashrc"' | tee -a ~/.profile
echo 'fi' | tee -a ~/.profile
echo 'fi' | tee -a ~/.profile
