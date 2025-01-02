#!/usr/bin/env bash
STOW_FOLDERS=`cat installed-packages`
MACHINE_NAME=$(uname -n)

for folder in $(echo $STOW_FOLDERS)
do
    echo "Installing $folder"
    stow -D $folder
    stow $folder

done

#while IFS=";" read -r source_path destination_path; do
    #source_path="$(echo "${source_path}" | tr -d '[:space:]')"
    #destination_path="$(echo "${destination_path}" | tr -d '[:space:]')"

    #override_file="$HOME/.override/$MACHINE_NAME/$source_path"
    #default_file="$HOME/.override/default/$source_path"

    ## Check if the source file exists before copying
    #if [ -e "$override_file" ]; then
        #cp "$override_file" "$HOME/$destination_path"
        #echo "Copied '$override_file' to '$destination_path'"
    #else
        #cp "$default_file" "$HOME/$destination_path"
        #echo "Copied '$default_file' to '$destination_path'"
    #fi
#done < override-config
