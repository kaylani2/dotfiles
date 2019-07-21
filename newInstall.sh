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
# sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ -> show saved SSID and passwords
# for d in ./*/ ; do (cd "$d" && touch it_werks); done -> enters every subdirectory (one level) and executes a command
#


# Using these for raspberry pi fresh installs
declare -a piPackages=(
'vim'
'git'
'python3'
'tmux' #terminal multiplexer
'curl' #data transfer tool
'evince'
'firefox-esr'
'password-gorilla'
'locate'
'software-properties-common' # add-apt-repository
#'nmap'
)

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
'perl-doc'
'perlqt-dev' #extern.h ?
'virtualbox'
'doxygen' # documentation and UML
'doxygen-gui' # documentation and UML
'nodejs' # required for node-red
)

declare -a pythonPackages=(
'python3'
'python3-pip'
'python3-numpy'
'python3-tk'
'python-matplotlib'
'python-setuptools' # pip
'cmake'
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
'unrar' #decompress .rar files
)


declare -a latexPackages=(
'texlive' #regular texlive is pretty bare bone, using it could be a headache
#'texlive-full' #full is really heavy
'evince'
)

declare -a multimediaPackages=(  
'vlc'
#'libav-tools'
'ffmpeg'
'audacity'
'fmit' #bass tuner
'rakarrack' #virtual effects rack
'guitarix' #rock guitar amplifier for Jack
'qjackctl' #user interface for controlling JACK (Jack Audio Connection Kit)
'pinta'
'img2pdf'
'clementine' #mp3 player
'handbrake' #media converter
'openshot' #video editing
#youtube-dl must be installed through pip to get the latest version
#something here will stop the process and ask something, don't know what it is yet
)

declare -a miscellaneousPackages=(  
'firefox'
'gparted'
'deluge'
'octave'
#'arduino' # Get arduino from the official website, the apt-get version is "SOMEWHAT" deprecated
'okteta'
'fritzing'
'fritzing-data'
'fritzing-parts'
'qtiplot'
'balena-etcher-electron' # image burner
#'mosquitto' # mqtt broker
#'mosquitto-clients' # mqtt client (pub/sub)
)

declare -a securityPackages=(
'password-gorilla'
'steghide'
#'proxychains'
'obfsproxy'
#'tor' #bulky
'nmap'
'nikto'
'netdiscover' #arp reconnaisance tool
#'macchanger' #macchanger will ask if the MAC address should be changed on its own
#'wireshark' #wireshark will ask if regular users should be able to capture packets
)

declare -a pipPackages=(
'pip' # always upgrade pip itself
'youtube-dl'
#'paho-mqtt' # python mqtt client
# youtube-dl -v -x --audio-format mp3 --playlist-start <NUMBER> --playlist-end <NUMBER> <CHANNEL_URL> 
)


if [ $# -eq 0 ]; then
    echo "Usage: bash $0 [pi | notPi]"
    exit 1
fi

if [ $1 == "pi" ]; then
  cd ~
  echo Pi Packages:
  echo ${piPackages[@]}
  echo
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y ${piPackages[@]}
  cd ~/dotfiles
  mv .vimrc ~/
  mv .tmux.conf ~/
  cd ..
  rm -rf dotfiles
  echo "alias l='ls -lh'" | sudo tee -a ~/.bashrc
  echo "alias tt='tmux'" | sudo tee -a ~/.bashrc
  exit 0
fi

if [ $1 == "notPi" ]; then
  echo \$TERM:
  echo $TERM
  echo Select your new default text editor:
  update-alternatives --config editor
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
  # \/ installing etcher (image burner)
  echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
  apt-get install -y ${developmentPackages[@]}
  apt-get install -y ${shellToolsPackages[@]}
  apt-get install -y ${javaPackages[@]}
  apt-get install -y ${latexPackages[@]}
  apt-get install -y ${miscellaneousPackages[@]}
  apt-get install -y ${securityPackages[@]}
  apt-get install -y ${multimediaPackages[@]}
  #apt-get install -y ${pythonPackages[@]} ## removed until fixed
  #pip3 install --upgrade ${pipPackages[@]}


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

  # \/ nodejs binaries are distributed by NodeSource
  #curl -sL https://deb.nodesource.com/setup_11.x | bash -
  #apt-get install -y nodejs


  ## \/ Install docker
  #echo "Installing Docker..."
  #sudo apt remove docker docker-engine docker.io containerd runc
  #sudo apt update
  #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  #sudo apt-key fingerprint 0EBFCD88
  #sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  #sudo apt update
  #sudo apt install docker-ce docker-ce-cli containerd.io
  #sudo gpasswd -a "${USER}" docker
  
  ## \/ Add Syntax file and other settings for TypeScript.
  #git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

  exit 0
fi # fi notPi
