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
read -p "Pfad zum zu konvertierenden Ordner: " inputFolder
if [ "${inputFolder: -1}" = "/" ]; then
    inputFolder="${inputFolder%?}"
fi

# create "converted" folder
outputFolder="${inputFolder}_converted"
mkdir -p "${outputFolder}"

# escape special characters
printf -v inputFolderEsc "%q" "$inputFolder"
printf -v outputFolderEsc "%q" "$outputFolder"

# go through files in user specified folder and convert them
for entry in "$inputFolder"/*
do
    if [ -f "$entry" ]; then
        export fspec=$entry
        fnameWithExt=$(basename "$fspec")
        printf -v fnameWithExtEsc "%q" "$fnameWithExt"
        fnameWithoutExt="${fnameWithExtEsc%.*}"
        fext="${fnameWithExt##*.}"

        #echo $fspec
        #echo $fdir
        #echo $fnameWithExt
        #echo $fnameWithExtEsc
        #echo $fnameWithoutExt
        #echo $fext

        if [ "$finalCommand" != "" ]; then
            finalCommand="$finalCommand; "
        fi
        finalCommand="$finalCommand HandBrakeCLI -i $inputFolderEsc/$fnameWithExtEsc -o $outputFolderEsc/$fnameWithoutExt.mp4"
    fi
done

eval $finalCommand