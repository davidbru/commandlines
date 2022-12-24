#!/bin/sh

##################
# CUSTOM ALIASES #
##################
# 0. source this very file in .zshrc
# 1. create an alias 'aliasList' to list all possibilites
# 2. source all files to create the aliases themselves
ALIASES=""

for file in $(dirname $0)/customAliase/*(.);
do
  file_name="${file##*/}"
  file_without_ext="${file_name%.*}"
  ALIASES+=" $ "$file_without_ext'
'
  source $file
done

alias aliasList="printf '%s' \"${ALIASES}\""