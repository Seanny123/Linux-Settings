cd /tmp

sudo dpkg --add-architecture i386 
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# Debian systems don't have `add-apt-repository` by default
sudo apt install software-properties-common python-software-properties

# system utilites
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo add-apt-repository --yes ppa:wine/wine-builds
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository --yes "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
sudo apt update

sudo apt install --yes trash-cli xclip git filezilla gedit unrar vlc pdfgrep htop shutter keepass2 curl
sudo apt install --yes nautilus-dropbox
sudo apt install --yes skype sublime-text
sudo apt install --install-recommends winehq-staging

wget https://www.foxitsoftware.com/downloads/latest.php?product=Foxit-Reader&platform=Windows&package_type=exe&language=English -O Foxit.exe

# Python specific
sudo apt install --yes python-dev python-setuptools python-tk python-pip
sudo apt install --yes python3-dev python3-setuptools python3-tk python3-pip
sudo -H pip3 install pip --upgrade
sudo -H pip3 install ipython ipdb flake8 seaborn pandas tables pytest scipy scikit-learn pylint notebook h5py hyperopt nbdime
sudo -H pip3 install jupyter --upgrade

mkdir ~/.jupyter/custom
wget https://raw.githubusercontent.com/Seanny123/jupyter-dark-theme/master/custom.css -P ~/.jupyter/custom

# Git specific
git config --global user.name "Sean Aubin"
git config --global user.email seanaubin@gmail.com
git-nbdiffdriver config --enable --global

# Waterloo VPN requirements
sudo apt install --yes network-manager-openconnect lib32z1 lib32ncurses5
wget https://cn-vpn.uwaterloo.ca/CACHE/stc/3/binaries/vpnsetup.sh
sudo bash vpnsetup.sh

# Remove the games, messaging and email stuff that I don't use that usually exists on a default Ubuntu install
sudo apt remove --yes thunderbird aisleriot gnome-calendar gnome-mahjongg gnome-mines gnome-mines

# Configure wine
wine notepad
wine Foxit.exe

# Configure NodeJS
# Note: 9.x might be available in the future
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g typescript tslint
wget https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i vscode-amd64.deb

# gnome tweaks
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
gsettings set org.gnome.desktop.wm.preferences focus-mode sloppy
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# update and upgrade, now that we have all these new packages
sudo apt update
sudo apt upgrade
