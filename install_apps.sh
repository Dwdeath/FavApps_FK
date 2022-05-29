#!/bin/sh

###################################
## Eddie's Custom Fedora Kinoite ##
###################################

# Some variables 
install="rpm-ostree install "
remove="rpm-ostree uninstall "
hard_remove="rpm-ostree override remove "
add_copr_repo="sudo wget -P /etc/yum.repos.d/ "
apps_list="https://dwdeath.github.io/FavApps_FK/app_list.txt"
repo_list_copr="https://dwdeath.github.io/FavApps_FK/copr_repo.txt"

# Remove Packages I don't need 
$remove firefox
#$remove vlc

# Install some packages
$install $(awk '{print $1}' curl -s apps_list)
exit 0

# Reboot
systemctl reboot
