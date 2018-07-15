#!/bin/bash
#add python to path if needed
#export PATH=/opt/usr/sbin:/opt/sbin:/opt/bin:$PATH
TZ='Europe/Vienna' date
DATE=$(date +'%Y-%m-%d_%H-%M')
DAYOFWEEK=$(date +'%w')

#BACKUP TEMP
influxd backup -database temp /home/pi/influxdb_backup/temp/$DATE
tar -cvzf /home/pi/influxdb_backup/temp/temp_$DATE.tar.gz /home/pi/influxdb_backup/temp/$DATE
rm -R /home/pi/influxdb_backup/temp/$DATE
scp -l 8192 /home/pi/influxdb_backup/temp/temp_$DATE.tar.gz plex@192.168.1.161:/home/plex/Dokumente/InfluxDB_Backup/temp/temp_$DATE.tar.gz
if [ "$DAYOFWEEK" != 0 ]; then
       rm /home/pi/influxdb_backup/temp/temp_$DATE.tar.gz
fi

#BACKUP INET
influxd backup -database inet /home/pi/influxdb_backup/inet/$DATE
tar -cvzf /home/pi/influxdb_backup/inet/inet_$DATE.tar.gz /home/pi/influxdb_backup/inet/$DATE
rm -R /home/pi/influxdb_backup/inet/$DATE
scp -l 8192 /home/pi/influxdb_backup/inet/inet_$DATE.tar.gz plex@192.168.1.161:/home/plex/Dokumente/InfluxDB_Backup/inet/inet_$DATE.tar.gz
rm /home/pi/influxdb_backup/inet/inet_$DATE.tar.gz
if [ "$DAYOFWEEK" != 0 ]; then
        rm /home/pi/influxdb_backup/inet/inet_$DATE.tar.gz
fi
