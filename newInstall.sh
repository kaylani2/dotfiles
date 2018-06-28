#!/bin/bash

###############################################################
###################### Beginners Section ###################### 
###############################################################
#
# ps -p $$ -> outputs the name of your shell
# apt-cache show <PACKAGE> -> show information about a package
# dpkg -i <PACKAGE>.deb -> install a .deb package
# echo $? -> output last code returned to the shell
#
#


###############################################################
######################### Git Basics ##########################
###############################################################
# 
# git init <PATH> -> initialize a git repository on <PATH>
# git status
# git add <FILE> 
# git commit 
# 
# 

declare -a developmentPackages=(
'vim'
'sublime-text'
'ctags'
'git'
'build-essential'
'libc6-dev'
'virtualbox'
)

declare -a pythonPackages=(
'python3'
'python3-numpy'
'python-setuptools'
# pip /\
)

declare -a javaPackages=(
'maven'
'default-jdk'
'default-jre'
'openjdk-8-jdk'
'openjdk-8-jre'
'zlib1g-dev'
'libncurses5-dev'
'lib32z1'
'lib32ncurses5'
)


declare -a shellToolsPackages=(
'tmux' #terminal multiplexer
'tree'
'screenkey'
'htop' #system monitor
'ranger' #file manager - nice mass renamer function
'curl' #data transfer tool
'wget' #web file retriever
)


declare -a latexPackages=(
#'texlive-full'
'evince'
)

declare -a multimediaPackages=(  
'vlc'
'libav-tools'
'ffmpeg'
'audacity'
'rakarrack'
'fmit' #bass tuner
'qjackctl'
'pinta'
'clementine' #mp3 player
#youtube-dl must be installed through pip to get the latest version
)

declare -a miscellaneousPackages=(  
'firefox'
'deluge'
'octave'
'arduino'
'okteta'
'fritzing'
'fritzing-data'
'fritzing-parts'
)

declare -a securityPackages=(
'password-gorilla'
'steghide'
'proxychains'
'obfsproxy'
'tor'
#'wireshark' #wireshark will ask if regular users should be able to capture packets
)

declare -a pipPackages=(
'youtube-dl'
# youtube-dl -v -x --audio-format mp3 --playlist-start <NUMBER> --playlist-end <NUMBER> <CHANNEL_URL> 
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


apt-get update
apt-get install -y ${developmentPackages[@]}
apt-get install -y ${shellToolsPackages[@]}
apt-get install -y ${pythonPackages[@]}
apt-get install -y ${javaPackages[@]}
apt-get install -y ${latexPackages[@]}
apt-get install -y ${miscellaneousPackages[@]}
apt-get install -y ${securityPackages[@]}
apt-get install -y ${multimediaPackages[@]}
#pip install --upgrade $(pipPackages[@])

#git clone https://github.com/kaylani2/dotfiles
#cd dotfiles
#cp .vimrc ~/.vimrc
#cp .tmux.conf ~/.tmux.conf


#\/Add the build repository and install the Metasploit Framework package:
#curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
#\/ Starts, must configure database on the first run
#./msfconsole
#\/ Show status
#db_status
