#!/bin/sh

###################################
## Eddie's Custom Fedora Kinoite ##
###################################

# Some variables 
install="rpm-ostree install"
remove="rpm-ostree uninstall"
hard_remove="rpm-ostree override remove"
add_copr_repo="sudo wget -P /etc/yum.repos.d/"
apps_list="https://dwdeath.github.io/FavApps_FK/list.txt"
repo_list_copr="https://dwdeath.github.io/FavApps_FK/copr_repo.txt"


# Update the system
rpm-ostree upgrade

# Enable some stuff 
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
flatpak update --appstream
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable copr packages
$add_copr_repo $(awk '{print $1}' curl -s repo_list_copr)

# Apply the repos
sudo rpm-ostree upgrade
sudo rpm-ostree update
exit 0

# Reboot
systemctl reboot
