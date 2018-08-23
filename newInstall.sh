#!/bin/bash

# some programs need to be installed manually and only under certain conditions
# these will be commented at the end of the script

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
'libboost-all-dev'
'lua5.3'
'perl'
'virtualbox'
)

declare -a pythonPackages=(
'python3'
'python3-numpy'
'python3-matplotlib' #required for using the mnist database
'python3-tk'
'python-matplotlib'
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
'texlive-full'
'evince'
)

declare -a multimediaPackages=(  
'vlc'
'libav-tools'
'ffmpeg'
'audacity'
'fmit' #bass tuner
'rakarrack' #virtual effects rack
'guitarix' #rock guitar amplifier for Jack
'qjackctl' #user interface for controlling JACK (Jack Audio Connection Kit)
'pinta'
'clementine' #mp3 player
'handbrake' #media converter
#youtube-dl must be installed through pip to get the latest version
#something here will stop the process and ask something, don't know what it is yet
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
'nmap'
#'macchanger' #macchanger will ask if the MAC adress should be changed on its own
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
pip install --upgrade $(pipPackages[@])

# \/ this line will ask for confirmation
#add-apt-repository ppa:dawidd0811/neofetch
#apt-get update
#apt-get install neofetch

#git clone https://github.com/kaylani2/dotfiles
#cd dotfiles
#cp .vimrc ~/.vimrc
#cp .tmux.conf ~/.tmux.conf
#cd ..
#rm -rf dotfiles

# \/Add the build repository and install the Metasploit Framework package:
#curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
#\/ Starts, must configure database on the first run
#msfconsole
#\/ Show status
#db_status
#msfupdate

# \/ Airgeddon framework
#git clone github.com/v1s1t0r1sh3r3/airgeddon.git
#cd airgeddon
#sudo bash ./airgeddon.sh
# Remember to manually install the dependencies for airgeddon
# Note: airgeddon makes a lot of noise, change your MAC before using it FOR GOOD THINGS
