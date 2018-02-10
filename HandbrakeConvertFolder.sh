#!/bin/sh

# Convert files with HandBrakeCLI in user specified folder
#   Creates a "converted" folder in the specified folder with the converted files

# Requirements
#   HandBrakeCLI needs to be present in PathVar
#   Current location: /usr/local/bin/HandBrakeCLI

# Usage
#   chmod +x ./HandbrakeConvertFolder.sh
#   ./HandbrakeConvertFolder.sh /path/to/folder

finalCommand=""
userSpecifiedFolder="$1"

# catch trailing slash from userinput
if [ "${userSpecifiedFolder: -1}" = "/" ]; then
  userSpecifiedFolder="${userSpecifiedFolder%?}"
fi

# create "converted" folder
finalFolder="converted"
mkdir -p "$userSpecifiedFolder"/"$finalFolder"

# go through files in user specified folder and convert them
for entry in "$userSpecifiedFolder"/*
do
  if [ -f "$entry" ]; then
	export fspec=$entry
	fdir=$(dirname "$fspec")
	fnameWithExt=$(basename "$fspec")
	fnameWitoutExt="${fnameWithExt%.*}"
	fext="${fnameWithExt##*.}"

	#echo $fspec
	#echo $fdir
	#echo $fnameWithExt
	#echo $fnameWitoutExt
	#echo $fext

	if [ "$finalCommand" != "" ]; then
	    finalCommand="$finalCommand && "
	fi
	finalCommand="$finalCommand HandBrakeCLI -i $fspec -o $fdir/$finalFolder/$fnameWitoutExt.mp4"
  fi
done

echo $finalCommand