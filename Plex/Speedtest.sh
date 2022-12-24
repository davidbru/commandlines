#!/bin/bash

RAWDATA=$(/home/plex/.local/bin/speedtest-cli --json | jq -r '. | "speedsIsp download=\(.download),upload=\(.upload),ping=\(.ping)"')
echo $RAWDATA

curl -i -XPOST "http://localhost:8086/write?db=HomeLogs" --data-binary "$RAWDATA"
