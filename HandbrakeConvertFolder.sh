#!/bin/bash

# Convert files with HandBrakeCLI in user specified folder
#   Creates a "converted" folder in the specified folder with the converted files

# Requirements
#   HandBrakeCLI needs to be present in PathVar
#   Current location: /usr/local/bin/HandBrakeCLI

# Usage
#   chmod +x ./HandbrakeConvertFolder.sh
#   ./HandbrakeConvertFolder.sh
#       specify /path/to/folder

finalCommand=""

# catch trailing slash from userinput
read -p "Pfad zum zu konvertierenden Ordner: " userSpecifiedFolder
if [ "${userSpecifiedFolder: -1}" = "/" ]; then
    userSpecifiedFolder="${userSpecifiedFolder%?}"
fi

# create "converted" folder
destinationFolder="${userSpecifiedFolder}_converted"
mkdir -p "${destinationFolder}"

# escape special characters
printf -v userSpecifiedFolderEsc "%q" "$userSpecifiedFolder"
printf -v destinationFolderEsc "%q" "$destinationFolder"

# go through files in user specified folder and convert them
for entry in "$userSpecifiedFolder"/*
do
    if [ -f "$entry" ]; then
        export fspec=$entry
        fnameWithExt=$(basename "$fspec")
        fnameWithoutExt="${fnameWithExt%.*}"
        fext="${fnameWithExt##*.}"

        #echo $fspec
        #echo $fdir
        #echo $fnameWithExt
        #echo $fnameWithoutExt
        #echo $fext

        if [ "$finalCommand" != "" ]; then
            finalCommand="$finalCommand; "
        fi
        finalCommand="$finalCommand HandBrakeCLI -i $userSpecifiedFolderEsc/$fnameWithExt -o $destinationFolderEsc/$fnameWithoutExt.mp4"
    fi
done

eval $finalCommand