#!/bin/sh

# PHP List Installed Versions
# $ phpList
alias phpList="brew ls --versions | ggrep -E 'php(@.*)?\s' | ggrep -oP '(?<=\s)\d\.\d' | uniq | sort"