#!/bin/bash

#ps -p $$
#apt-cache show <PACKAGE>

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
'vlc'
'libav-tools'
'ffmpeg'
'audacity'
'rakarrack'
'fmit' #bass tuner
'qjackctl'
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
# youtube-dl -v -x --audio-format mp3 <CHANNEL_URL> 
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
#cp .vimrc ~/.vimrc
#cp .tmux.conf ~/.tmux.conf


#\/Add the build repository and install the Metasploit Framework package:
#curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
#\/ Starts, must configure database on the first run
#./msfconsole
#\/ Show status
#db_status
