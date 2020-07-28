#!/bin/bash
# @TODO: clean this mess!

# some programs need to be installed manually and only under certain conditions
# these will be commented at the end of the script

###############################################################
###################### Useful Commands ########################
###############################################################
#
# crontab -e -> eDiT cRoNtAb
#
# ps -p $$ -> output the name of your shell
#
# apt-cache show <PACKAGE> -> show information about a package
#
# dpkg -i <PACKAGE>.deb -> install a .deb package
#
# echo $? -> output last code returned to the shell
#
# sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ -> show saved SSID and passwords
#
# for d in ./*/ ; do (cd "$d" && touch it_werks); done -> enters every subdirectory (one level) and executes a command
#
# for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done ## TURN SPACES INTO UNDERSCORES
#
# convert -coalesce file_name.gif file_name.png ## CONVERTS A GIF INTO A BUNCH OF PNGs
############################ FFMPEG ###################################
# Synopsis: ffmpeg -i [input_file] -ss [start_seconds] -t [duration_seconds] [output_file]
#
# ffmpeg -i video.mp4 -hide_banner ## GET VIDEO INFORMATION
#
# ffmpeg -formats # LIST AVAILABLE FORMATS
#
# ffmpeg -i input.webm -qscale 0 output.mp4 # CONVERT PRESERVING QUALITY
#
# ffmpeg -i input.mp4 -filter:v scale=1280:720 -c:a copy output.mp4 # RESIZE VIDEO
#
# ffmpeg -i input.mp4 -vf scale=1280:-1 -c:v libx264 -preset veryslow -crf 24 output.mp4 # COMPRESS VIDEO (CRF IS THE COMPRESSION RATE???, REDUCE THE NUMBER TO IMPROVE QUALITY)
#
# ffmpeg -i input.mp4 -vn output.mp3 # EXTRACT AUDIO
#
# \/ use FFmpeg cut mp4 video with re-encoding
# ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -async 1 -strict -2 cut_video.mp4 -> Extract part of a video with a one-line command
#
# ffmpeg -i input.mp4 -ss 01:10:27 -to 02:18:51 -c:v copy -c:a copy output.mp4 -> Extract part of a video with a one-line command (should be instantaneous)
#
# ffmpeg -i video -vf "select='between(t,4,6.5)+between(t,17,26)+between(t,74,91)',setpts=N/FRAME_RATE/TB" -af "aselect='between(t,4,6.5)+between(t,17,26)+between(t,74,91)',asetpts=N/SR/TB" out.mp4
## /\ select and its counterpart filter is applied to the video and audio respectively. Segments selected are times 4 to 6.5 seconds, 17 to 26 seconds and finally 74 to 91 seconds. The timestamps are made continuous with the setpts and its counterpart filter..


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
'virtualbox-qt'
'doxygen' # documentation and UML
'doxygen-gui' # documentation and UML
'nodejs' # required for node-red
'xclip' # required for formatting ssh keys into bitbucket
'grip' # preview for markdown files (grip -b README.md)
)

declare -a pythonPackages=(
#'python3'
'python3-pip'
#'python3-numpy'
#'python3-tk'
#'python-matplotlib'
#'python-setuptools' # pip
#'cmake'
#'setuptools'
#'graphviz'
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
#'qjackctl' #user interface for controlling JACK (Jack Audio Connection Kit) #prompts
'pinta'
'img2pdf'
'clementine' #mp3 player
'handbrake' #media converter
'openshot' #video editing
'imagemagick' # convert .gif to .png frames and .jpg images into .pdf bundle
#youtube-dl must be installed through pip to get the latest version
#something here will stop the process and ask something, don't know what it is yet
#'melt' # video editor, it's supposed to be good
)

declare -a miscellaneousPackages=(
'firefox'
'gparted'
'deluge'
'octave'
'octave-control'
#'arduino' # Get arduino from the official website, the apt-get version is "SOMEWHAT" deprecated
'okteta'
'fritzing'
'fritzing-data'
'fritzing-parts'
'qtiplot'
'balena-etcher-electron' # image burner
#'mosquitto' # mqtt broker
#'mosquitto-clients' # mqtt client (pub/sub)
'djview4' # convert .djvu to .pdf
'screen'
'locate'
'tree'
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
'pip3' # always upgrade pip itself
'youtube-dl'
'pipenv'
'control' # get the rlocus plot
'pandas'
'numpy'
'scipy'
'ipython'
'scikit-learn'
'matplotlib'
'mglearn'
'xlrd' # enable pandas to read excel
## you have to use the flag --ignore-installed when installing tensorflow
'testresources' ## dependency for a dependency for tensorflow
'setuptool' ## dependency for a dependency for tensorflow
'joblib'
'tensorflow' # dependency for keras
'tensorflow-datasets'
'tflearn' # yet another wrapper for tensorflow
'keras' # sequential model for neural networks, frontend for tensorflow (amongst others)
'sympy' # symbolic mathematics, useful for plotting
'joblib'
'graphviz' # useful for visualization of decision trees in scikit
#'paho-mqtt' # python mqtt client
# youtube-dl -v -x --audio-format mp3 --playlist-start <NUMBER> --playlist-end <NUMBER> <CHANNEL_URL>
'seaborn' # statistical data visualization, required for manual rlocus on octave
'influxdb' ## little wrapper to query influxdb
'nbformat'
'theano'
'pydot'
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
  echo "stty ixany" | sudo tee -a ~/.bashrc
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

  cp .vimrc ~/.vimrc
  cp .tmux.conf ~/.tmux.conf
  touch ~/.ssh/config
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

  apt-get update
  apt-get install -y ${developmentPackages[@]}
  apt-get install -y ${shellToolsPackages[@]}
  apt-get install -y ${javaPackages[@]}
  apt-get install -y ${latexPackages[@]}
  apt-get install -y ${miscellaneousPackages[@]}
  apt-get install -y ${securityPackages[@]}
  apt-get install -y ${multimediaPackages[@]}
  apt-get install -y ${pythonPackages[@]}
  pip3 install --upgrade ${pipPackages[@]}


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

  ## \/ Install awscli and aws-sam
  #pip3 install pyyaml --verbose
  #pip3 install --upgrade --user awscli
  #pip3 install --user aws-sam-cli

  ## \/ Add Syntax file and other settings for TypeScript on Vim.
  #git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

  ## mailutils is needed for the mail command
  ## \/ this line will generate a prompt to confirm a few options, maybe install it manually...
  # sudo apt install mailutils

  exit 0
fi # fi notPi
