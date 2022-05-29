###################################
## Eddie's Custom Fedora Kinoite ##
###################################

# Some variables 
install="rpm-ostree install"
remove=rpm-"ostree uninstall"
apps_list=https://dwdeath.github.io/FavApps_FK/list.txt


# Update the system
rpm-ostree upgrade
rpm-ostree update

# Remove Packages I don't need 
$remove firefox
$remove vlc

# Enable some stuff 
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
flatpak update --appstream
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable copr packages
sudo ostree remote add rtl88x2bu https://download.copr.fedorainfracloud.org/results/farribeiro/rtl88x2bu-kmod/fedora-$releasever-$basearch/
#sudo ostree remote add 

# Install some packages
sudo $install $(awk '{print $1}' curl -s apps_list)
