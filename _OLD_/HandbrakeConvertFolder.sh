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
read -p "Pfad zum zu konvertierenden Ordner:
[Standard: /mnt/plex/data/PlexLibrary/c/]" inputFolder
if [ ! "$inputFolder" ]; then
    inputFolder="/mnt/plex/data/PlexLibrary/c/"
fi
if [ "${inputFolder: -1}" = "/" ]; then
    inputFolder="${inputFolder%?}"
fi

# create "converted" folder
outputFolder="${inputFolder}_converted"
mkdir -p "${outputFolder}"

# go through files in user specified folder and convert them
for entry in "$inputFolder"/*
do
    if [ -f "$entry" ]; then
        export fspec=$entry
        fnameWithExt=$(basename "$fspec")
        fnameWithoutExt="${fnameWithExt%.*}"
        fext="${fnameWithExt##*.}"

        #echo $fspec
        #echo $fnameWithExt
        #echo $fnameWithoutExt
        #echo $fext

        # escape special characters
        printf -v inputFileFolder "%q" "$inputFolder/$fnameWithExt"
        printf -v outputFileFolder "%q" "$outputFolder/$fnameWithoutExt.mp4"

        if [ "$finalCommand" != "" ]; then
            finalCommand="$finalCommand; "
        fi
        finalCommand="$finalCommand HandBrakeCLI -i $inputFileFolder -o $outputFileFolder"
    fi
done

eval $finalCommand