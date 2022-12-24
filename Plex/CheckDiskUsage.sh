#!/bin/bash

# src: https://unix.stackexchange.com/a/84359

ALERT=85

message=$(df -h | awk -v ALERT="$ALERT" '
    NR == 1 {next}
    $1 == "abc:/xyz/pqr" {next}
    $1 == "tmpfs" {next}
    $1 == "/dev/cdrom" {next}
    1 {sub(/%/,"",$5)}
    $5 >= ALERT {printf "%s is almost full: %d%%\n", $1, $5}
')
if [ -n "$message" ]; then
    #echo "$message"
    echo "$message" | mail -s "PLEX: Almost out of disk space" -a "From: strom@i-am-alive.at" david@i-am-alive.at
fi
