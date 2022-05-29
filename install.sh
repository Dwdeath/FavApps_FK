# set variables
apps_list=https://dwdeath.github.io/SUSEFavApps/list.txt

# remove unwanted packages
sudo apt-get -y remove firefox
sudo apt-get -y remove vlc

# update system
sudo apt-get -y update
sudo apt-get -y upgrade

# install pkg
sudo apt-get -y install $(awk '{print $1}' curl -s apps_list)
