###################################
## Eddie's Custom Fedora Kinoite ##
###################################

# Some variables 
apps_list=https://dwdeath.github.io/FavApps_FK/list.txt


# Update the system


# Remove Packages I don't need 
# firefox
# vlc

# Enable some stuff 


# Install some packages
ostree $(awk '{print $1}' curl -s apps_list)
