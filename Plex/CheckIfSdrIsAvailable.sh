#!/bin/bash

LSUSB_VAR=$(lsusb | grep "Realtek Semiconductor Corp. RTL2838 DVB-T" | wc -l)
#echo $LSUSB_VAR

if [ $LSUSB_VAR != 1 ]; then
    echo "SDR is currently not available" | mail -s "PLEX: SDR NOT AVAILABLE" -a "From: strom@i-am-alive.at" david@i-am-alive.at
#else
#    echo "SDR is currently available" | mail -s "PLEX: SDR AVAILABLE" -a "From: strom@i-am-alive.at" david@i-am-alive.at
fi
