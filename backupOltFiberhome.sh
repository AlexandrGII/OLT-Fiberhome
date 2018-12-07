#!/bin/bash
#	@Jefte de Lima Ferreira
#	jeftedelima at gmail dot com
#	10 00 * * *     root    sh /home/yourdirectory/backupOltFiberhome.sh 192.168.50.2 > /dev/null 2>&1

if [ -z ${1} ] ; then
	echo "You need to specify the IP address of OLT"
	echo "Usage example: ./backupOltFiberhome.sh 192.168.50.2"
	exit 1
fi

DATA=$(date +"%d-%m-%Y")
IP_OLT=$1
#	User and Pass
USER='GEPON'
PASS='GEPON'
#	Super user and pass
SPUSER='EN'
SPPASS='GEPON'
#	IP FTPServer
FTPSERVER='10.255.250.157'
#	User and pass of FTPServer
FTPUSER='prodata'
FTPPASS='pro5451pro'
#	Directory where it will be stored backupfile
FTPDIR="/home/prodata/configs/olt/$IP_OLT/OLT_"$IP_OLT"_"$DATA".cfg"
#	Command to perform the backup
CMD="upload ftp config $FTPSERVER $FTPUSER $FTPPASS $FTPDIR"

#	Connection
(
echo open "$IP_OLT"
sleep 2
echo "$USER"
sleep 2
echo "$PASS"
sleep 2
echo "$SPUSER"
sleep 2
echo "$SPPASS"
sleep 2
echo "$CMD"
sleep 2
echo "exit"
) | telnet
