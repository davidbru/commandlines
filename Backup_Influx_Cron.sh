#!/bin/bash
#add python to path if needed
#export PATH=/opt/usr/sbin:/opt/sbin:/opt/bin:$PATH
TZ='Europe/Vienna' date
DATE=$(date +'%Y-%m-%d_%H-%M')
DAYOFWEEK=$(date +'%w')

for mode in temp inet
do
	#define variables
	PATHFOLDER="$mode"/"$mode"_"$DATE"
	PATHPI=/home/pi/influxdb_backup/"$PATHFOLDER"
	PATHPLEX=/home/plex/Dokumente/InfluxDB_Backup/"$PATHFOLDER"

	echo "BACKUP $mode"

	influxd backup -database "$mode" "$PATHPI"
	tar -cvzf "$PATHPI".tar.gz "$PATHPI"
	rm -R "$PATHPI"
	scp -l 8192 "$PATHPI".tar.gz plex@192.168.1.161:"$PATHPLEX".tar.gz

	#remove file if it is not sunday --> weekly backup stays on the pi
	if [ "$DAYOFWEEK" != 0 ]; then
		rm "$PATHPI".tar.gz
	fi
done
