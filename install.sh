###################################
## Eddie's Custom Fedora Kinoite ##
###################################

# Some variables 
install="rpm-ostree install "
remove="rpm-ostree uninstall "
hard_remove="rpm-ostree override remove "
add_copr_repo="sudo wget -P /etc/yum.repos.d/ "
apps_list=https://dwdeath.github.io/FavApps_FK/list.txt
repo_list_copr="https://dwdeath.github.io/FavApps_FK/copr_repo.txt"


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
$add_copr_repo $(awk '{print $1}' curl -s repo_list_copr)
# $copr_repo https://copr.fedorainfracloud.org/coprs/benjaminfo/rtl8822bu/repo/fedora-36/benjaminfo-rtl8822bu-fedora-36.repo
# $copr_repo https://copr.fedorainfracloud.org/coprs/farribeiro/rtl88x2bu-kmod/repo/fedora-36/farribeiro-rtl88x2bu-kmod-fedora-36.repo
# $copr_repo https://copr.fedorainfracloud.org/coprs/scorreia/rtl88x2bu/repo/fedora-36/scorreia-rtl88x2bu-fedora-36.repo
#sudo ostree remote add rtl88x2bu https://download.copr.fedorainfracloud.org/results/benjaminfo/rtl8822bu/fedora-$releasever-$basearch/
#sudo ostree remote add 

# Apply the repos
sudo rpm-ostree upgrade

# Install some packages
$install $(awk '{print $1}' curl -s apps_list)
