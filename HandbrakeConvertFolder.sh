#!/bin/sh

# Convert files with HandBrakeCLI in user specified folder
#   Creates a "converted" folder in the specified folder with the converted files

# Requirements
#   HandBrakeCLI needs to be present in PathVar
#   Current location: /usr/local/bin/HandBrakeCLI

# Usage
#   ./HandbrakeConvertFolder.sh /path/to/folder

# create "converted" folder
finalFolder="converted"
mkdir -p "$1"/"$finalFolder"

# go through files in user specified folder and convert them
for entry in "$1"/*
do
  if [ -f "$entry" ]; then
	export fspec=$entry
	fdir=$(dirname "$fspec")
	fnameWithExt=$(basename "$fspec")
	fnameWitoutExt="${fnameWithExt%.*}"
	fext="${fnameWithExt##*.}"

	echo $fspec
	echo $fdir
	#echo $fnameWithExt
	echo $fnameWitoutExt
	echo $fext

	echo "HandBrakeCLI -i $fspec -o $fdir/$finalFolder/$fnameWitoutExt.mp4"
  fi
done