#!/bin/bash

#ps -p $$

declare -a developmentPackages=(
'vim'
'sublime-text'
'ctags'
'git'
'libc6-dev'
'virtualbox'
)

declare -a pythonPackges=(
'python3'
'python3-numpy'
'python-setuptools'
# pip /\
)

declare -a shellToolsPackages=(
'tmux'
'tree'
'screenkey'
'htop'
)


declare -a latexPackages=(
'texlive-full'
'evince'
)

declare -a multimediaPackages=(  
'audacity'
'vlc'
'libav-tools'
'ffmpeg'
'ffprobe'
'clementine' #mp3 player
#youtube-dl must be installed through pip to get the latest version
)

declare -a miscellaneousPackages=(  
'firefox'
'deluge'
'octave'
'arduino'
'okteta'
'steghide'
)

declare -a securityPackages=(
'password-gorilla'
'wireshark'
)

declare -a pipPackages=(
'youtube-dl'
# youtube-dl -v -x --audio-format -mp3 <CHANNEL_URL> 
)

cd ~
echo Devolopment Packages:
echo ${developmentPackages[@]}
echo
echo Shell Tools:
echo ${shellToolsPackages[@]}
echo
echo Latex:
echo ${latexPackages[@]}
echo
echo Miscellaneous:
echo ${miscellaneousPackages[@]}
echo
echo Security:
echo ${securityPackages[@]}
echo
echo Multimedia:
echo ${multimediaPackages[@]}
echo
echo Pip Packages:
echo ${pipPackages[@]}


#apt update
#apt install -y ${developmentPackages[@]}
#apt install -y ${shellToolsPackages[@]}
#apt install -y ${latexPackages[@]}
#apt install -y ${miscellaneousPackages[@]}
#apt install -y ${securityPackages[@]}
#apt install -y ${multimediaPackages[@]}
#pip install --upgrade $(pipPackages[@])

#git clone https://github.com/kaylani2/dotfiles
#cd dotfiles
#cp .vim ~/.vimrc
#cp .tmux.conf ~/.tmux.conf
