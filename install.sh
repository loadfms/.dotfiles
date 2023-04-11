STOW_FOLDERS=`cat installed-packages`

for folder in $(echo $STOW_FOLDERS)
do
    echo "Installing $folder"
    stow -D $folder
    stow $folder
done

cd x11
sudo stow -t /etc/X11/ .
