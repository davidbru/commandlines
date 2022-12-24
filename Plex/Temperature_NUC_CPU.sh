#!/bin/bash

RAWDATA=$(paste -d '=' <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | sed 's/\(.\)..$/.\1/' | tr '\n' , | rev | cut -c2- | rev | cut -d, -f2-)
echo $RAWDATA

echo "curl -i -XPOST \"http://localhost:8086/write?db=HomeLogs\" --data-binary \"temperaturesNuc $RAWDATA\""
curl -i -XPOST "http://localhost:8086/write?db=HomeLogs" --data-binary "temperaturesNuc $RAWDATA"
